# apps

ArgoCD-managed applications, deployed to `norriswu0-prod` (prod) and `norriswu0-dev` (dev) via kustomize overlays.

## Structure

Each app follows the `base/` + `overlays/` pattern:

- `base/` — shared resources (no namespace, no environment-specific config)
- `overlays/prod/` — namespace `norriswu0-prod`
- `overlays/dev/` — namespace `norriswu0-dev`

## Apps

| App                                             | Image                                      | Port      | Tailscale                                                  | PVC |
| ----------------------------------------------- | ------------------------------------------ | --------- | ---------------------------------------------------------- | --- |
| [beaverhabit](./beaverhabit/overlays/prod/)     | `daya0576/beaverhabits:sha-fa5a178`        | 8080      | `habits.hoki-solt.ts.net`                                  | 1Gi |
| [bentopdf](./bentopdf/overlays/prod/)           | `ghcr.io/alam00000/bentopdf-simple:latest` | 8080      | `pdf.hoki-solt.ts.net`                                     | —   |
| [yuvomi](./yuvomi/overlays/prod/)               | `ghcr.io/ulsklyc/yuvomi:latest`            | 3000      | `yuvomi.hoki-solt.ts.net`                                  | 1Gi |
| [hermes](./hermes/overlays/prod/)               | `nousresearch/hermes-agent:v2026.7.30`     | 9119/8642 | `hermes.hoki-sole.ts.net` / `hermes-api.hoki-sole.ts.net`  | 5Gi |

## ArgoCD Namespace Resource Whitelist

Required `namespaceResourceWhitelist` entries for the AppProject:

```yaml
- group: ""
  kind: Service
- group: ""
  kind: PersistentVolumeClaim
- group: ""
  kind: Secret
- group: apps
  kind: Deployment
- group: networking.k8s.io
  kind: Ingress
- group: external-secrets.io
  kind: ExternalSecret
```

## Dependencies

- **Tailscale Operator** — `ingressClassName: tailscale`, tailnet `hoki-solt.ts.net`
- **External Secrets Operator** + Infisical SecretStore `norriswu0-secret-store` ([base](./norriswu0-secret-store/base/), [prod](./norriswu0-secret-store/overlays/prod/), [dev](./norriswu0-secret-store/overlays/dev/))
- **Infisical** — secret `/beaverhabit/TRUSTED_LOCAL_EMAIL` provisioned
- **Hermes** — Infisical secrets under `/hermes/`; Authentik OIDC callback `https://hermes.hoki-sole.ts.net/auth/callback`
