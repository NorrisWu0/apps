# apps

ArgoCD-managed applications deployed to the `norriswu0` namespace.

## Apps

| App                           | Image                                      | Port | Tailscale                 | PVC |
| ----------------------------- | ------------------------------------------ | ---- | ------------------------- | --- |
| [beaverhabit](./beaverhabit/) | `daya0576/beaverhabits:sha-fa5a178`        | 8080 | `habits.hoki-solt.ts.net` | 1Gi |
| [bentopdf](./bentopdf/)       | `ghcr.io/alam00000/bentopdf-simple:latest` | 8080 | `pdf.hoki-solt.ts.net`    | —   |
| [yuvomi](./yuvomi/)           | `ghcr.io/ulsklyc/yuvomi:latest`            | 3000 | `yuvomi.hoki-solt.ts.net` | 1Gi |
| [hermes](./hermes/)           | `nousresearch/hermes-agent:v2026.7.30`    | 9119/8642 | `hermes.hoki-sole.ts.net` / `hermes-api.hoki-sole.ts.net` | 5Gi |

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
- **External Secrets Operator** + Infisical SecretStore `norriswu0-secret-store`
- **Infisical** — secret `/beaverhabit/TRUSTED_LOCAL_EMAIL` provisioned
- **Hermes** — Infisical secrets under `/hermes/`; Authentik OIDC callback `https://hermes.hoki-sole.ts.net/auth/callback`
