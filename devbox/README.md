# devbox

**Not deployed. Production only.** A single-user SSH development container, exposed privately through the Tailscale Operator's L3 TCP service proxy. There is no public ingress, Tailscale SSH authentication, or External Secrets dependency. OpenSSH authenticates user `norris` with the public key versioned in `base/configmap.yaml`.

## Onboarding in ArgoCD

1. The Deployment pins the public Debian image from the sibling devbox repository by digest in `base/deployment.yaml`. The image includes Git, mise, and OpenSSH; no registry credential is required by this app. These manifests do not publish or deploy anything automatically.
2. Ensure the cluster has Linux amd64 capacity, a default StorageClass supporting a 32Gi ReadWriteOnce PVC, and the Tailscale Operator configured to expose annotated Services. Allow the operator's proxy identity to receive TCP 22 from the intended clients in the tailnet ACL/grants; do not configure Funnel. Namespace admission policy must permit the root SSH supervisor and the six explicitly granted capabilities.
3. Add an ArgoCD Application pointing to this **apps repository**, the revision containing these manifests, and `devbox/overlays/prod` with destination namespace `norriswu0-prod`. Create the namespace first or enable ArgoCD's `CreateNamespace=true`. The AppProject must permit ConfigMap, PersistentVolumeClaim, Service, and Deployment. Review and sync deliberately.

To update the image, change the digest in `base/deployment.yaml` to a verified published image, then commit and sync. Kustomize generates the startup ConfigMap from `base/startup/start.sh` and `base/startup/sshd_config`; its content hash changes the pod template so startup configuration changes trigger a rollout. There is no development overlay.

## Connect and verify the host key

First obtain the server fingerprint through trusted cluster access, **not** an unauthenticated network scan:

```sh
kubectl -n norriswu0-prod exec deployment/devbox -- \
  ssh-keygen -lf /var/lib/devbox/ssh/ssh_host_ed25519_key.pub
ssh -o StrictHostKeyChecking=ask norris@devbox
```

Compare the SHA256 fingerprint in the SSH prompt with the trusted output before accepting. Use the hostname's full MagicDNS name if short-name resolution is unavailable. Keep the corresponding private client key on your client and select it with `ssh -i` if necessary. Do not copy it into the image, ConfigMap, or repository. TCP 22 on the Service forwards to OpenSSH on container port 2222; normal SSH keys and tailnet network access are both required.

An unexpected changed-host-key warning is a reason to investigate, not remove `known_hosts` blindly. The host identity should survive pod replacement; replacing or losing the PVC changes it.

## Start, stop, and change keys

Edit `replicas[0].count` in `overlays/prod/kustomization.yaml` to `0` to stop or `1` to start, commit, and sync ArgoCD. Do not scale above one: the Deployment uses `Recreate` and a single ReadWriteOnce volume. Direct `kubectl scale` can be reverted by GitOps self-healing; suspend automated reconciliation before an emergency manual stop, then reconcile the desired count in Git before resuming it. Stopping the pod retains the PVC and may leave the tailnet proxy present, but SSH is unavailable.

To rotate access, replace or add public-key lines under `data.norris` in `base/configmap.yaml`, commit, and sync. The whole ConfigMap directory is mounted read-only at `/etc/devbox/authorized_keys`, with key files mode `0444`; this is not a `subPath` mount. Kubelet eventually projects updates, and new SSH authentications read the updated file without restarting the pod. Revoking a key does not close an already authenticated session. Never add private key material or an ESO resource.

## Persistent data and limits

The 32Gi `devbox-data` PVC is mounted at `/var/lib/devbox`. The mounted startup script creates user `norris` (UID/GID 1000), links `/home/norris` to `/var/lib/devbox/home`, prepares directory ownership, and generates the Ed25519 SSH host key only if it is missing from `/var/lib/devbox/ssh`. It then starts OpenSSH in the foreground on port 2222 with public-key-only authentication and root login disabled. No packages are installed at startup.

Keep work, mise tools, and user configuration under the home directory. Changes elsewhere in the container filesystem are ephemeral. There is no Docker socket, host networking, privileged mode, sidecar, init container, or Kubernetes API token mount.

Requests are 1 CPU / 2Gi memory and limits are 4 CPU / 8Gi memory. The mounted startup script and SSH supervisor run as root; SSH sessions run as `norris`. All capabilities are dropped except `CHOWN`, `DAC_OVERRIDE`, `FOWNER`, `SETGID`, `SETUID`, and `SYS_CHROOT`; privilege escalation is disabled and seccomp uses `RuntimeDefault`. TCP startup, readiness, and liveness probes check port 2222, not authentication or workspace integrity.

The standalone PVC carries `argocd.argoproj.io/sync-options: Prune=false,Delete=false` so ArgoCD pruning or Application deletion preserves it. Recreating the app in the same namespace can reuse the existing claim. This is **retention, not a backup**; arrange independent backups of workspace data and host keys. Namespace deletion or manual PVC deletion can still destroy data depending on the StorageClass reclaim policy. To deliberately discard an environment, stop it first, back up what you need, and explicitly delete its `devbox-data` PVC only after reviewing the storage consequences. Do not delete the namespace as a routine stop operation.
