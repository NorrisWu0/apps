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
| [me](./me/overlays/prod/)                       | `ghcr.io/norriswu0/me:latest`              | 3000      | `me.norriswu.me` / `norriswu.me`                            | —   |
| [norriswu0-db](./norriswu0-db/overlays/prod/)   | CloudNativePG + pgAdmin                    | 5432/80   | `blayground.norriswu.me`                                    | 1Gi |

## Networking (prod only)

[network](./network/overlays/prod/) exposes workloads publicly via Cloudflare Tunnel:

- **cloudflared** — remotely-managed tunnel (`TUNNEL_TOKEN`), routes Cloudflare edge → `norriswu0-gateway:80`
- **kgateway Gateway** (`norriswu0-gateway`) — in-cluster HTTP gateway; workloads attach via `HTTPRoute`
- **cert-manager Issuer** (`norriswu0-tls-issuer-prod`) — Let's Encrypt DNS01 via Cloudflare

Dev workloads stay Tailscale-only.

## ArgoCD Namespace Resource Whitelist

Required `namespaceResourceWhitelist` entries for the AppProject:

```yaml
- group: ""
  kind: Service
- group: ""
  kind: PersistentVolumeClaim
- group: ""
  kind: Secret
- group: ""
  kind: ServiceAccount
- group: apps
  kind: Deployment
- group: networking.k8s.io
  kind: Ingress
- group: external-secrets.io
  kind: ExternalSecret
- group: cert-manager.io
  kind: Issuer
- group: cert-manager.io
  kind: Certificate
- group: gateway.networking.k8s.io
  kind: Gateway
- group: gateway.networking.k8s.io
  kind: HTTPRoute
- group: gateway.kgateway.dev
  kind: GatewayParameters
- group: postgresql.cnpg.io
  kind: Cluster
- group: postgresql.cnpg.io
  kind: Database
- group: postgresql.cnpg.io
  kind: DatabaseRole
```

## Dependencies

- **Tailscale Operator** — `ingressClassName: tailscale`, tailnet `hoki-solt.ts.net`
- **External Secrets Operator** + Infisical SecretStore `norriswu0-secret-store` ([base](./norriswu0-secret-store/base/), [prod](./norriswu0-secret-store/overlays/prod/), [dev](./norriswu0-secret-store/overlays/dev/))
- **`ghcr-credential`** — shared GHCR image pull secret ([base](./ghcr-credential/base/), [prod](./ghcr-credential/overlays/prod/), [dev](./ghcr-credential/overlays/dev/)); sourced from Infisical root secrets `GHCR_USERNAME` / `GHCR_TOKEN` (classic PAT, `read:packages`), and bound to the namespace `default` ServiceAccount so deployments don't need `imagePullSecrets`
- **Infisical** — secret `/beaverhabit/TRUSTED_LOCAL_EMAIL` provisioned
- **Hermes** — Infisical secrets under `/hermes/`; Authentik OIDC callback `https://hermes.hoki-sole.ts.net/auth/callback`
- **Network / Cloudflare** — Infisical secrets `/cloudflare/API_TOKEN` (DNS01) and `/cloudflare/TUNNEL_TOKEN` (tunnel); Cloudflare public hostname → `http://norriswu0-gateway.norriswu0-prod.svc.cluster.local:80` is configured in the Cloudflare Zero Trust dashboard
- **CloudNativePG** — cluster `norriswu0-db` (1 instance, 1Gi, no backup). `DatabaseRole` CR (`playground-user`) + `Database` CR (`playground`, owner `playground-user`); superuser `postgres`, the role's password + pgAdmin credentials are provisioned by ESO from Infisical under `/norriswu0-db/` (`DB_SUPERUSER_PASSWORD`, `PLAYGROUND_USER_PASSWORD`, `PGADMIN_EMAIL`, `PGADMIN_PASSWORD`)
