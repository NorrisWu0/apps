# Secret Store

Cloud-backed Infisical `SecretStore` used by the applications in the
`norriswu0-prod` (prod) and `norriswu0-dev` (dev) namespaces.

## Structure

- `base/` — the `SecretStore` (no namespace; the auth secret defaults to the
  SecretStore's own namespace). Fetches from the `prod` Infisical environment.
- `overlays/prod/` — namespace `norriswu0-prod`, plus the prod sealed credential.
- `overlays/dev/` — namespace `norriswu0-dev`, patches `environmentSlug` to
  `dev`.

Each overlay carries its own `infisical-universal-auth` SealedSecret for its
namespace.

## Create the sealed credential

1. Copy the template to a local, ignored file:

   ```bash
   cp infisical-universal-auth.secret.yaml.template infisical-universal-auth.secret.yaml
   ```

2. Set the namespace to `norriswu0-prod` or `norriswu0-dev`, then replace both
   placeholder values with the Infisical Cloud Universal Auth client ID and
   client secret.

3. Seal it using the cluster's Sealed Secrets controller certificate:

   ```bash
   kubeseal --format yaml \
     < infisical-universal-auth.secret.yaml \
     > infisical-universal-auth.sealed.yaml
   ```

4. Delete the unsealed local file and place the generated
   `infisical-universal-auth.sealed.yaml` in the target overlay
   (`overlays/prod/` or `overlays/dev/`), then reference it from that overlay's
   `kustomization.yaml`.

The unsealed file must never be committed. The generated SealedSecret is safe
to commit because its values are encrypted for the target cluster.
