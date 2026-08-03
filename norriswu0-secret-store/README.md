# Cluster Dependencies

This directory contains the Cloud-backed `ClusterSecretStore` used by the
applications in the `norriswu0` namespace.

## Create the sealed credential

1. Copy the template to a local, ignored file:

   ```bash
   cp infisical-universal-auth.secret.yaml.template infisical-universal-auth.secret.yaml
   ```

2. Replace both placeholder values with the Infisical Cloud Universal Auth
   client ID and client secret.

3. Seal it using the cluster's Sealed Secrets controller certificate:

   ```bash
   kubeseal --format yaml \
     < infisical-universal-auth.secret.yaml \
     > infisical-universal-auth.sealed.yaml
   ```

4. Delete the unsealed local file and add the generated
   `infisical-universal-auth.sealed.yaml` to `kustomization.yaml`.

5. Replace `REPLACE_WITH_CLOUD_PROJECT_SLUG` in `secret-store.yaml` with the
   Infisical Cloud project slug.

The unsealed file must never be committed. The generated SealedSecret is safe
to commit because its values are encrypted for the target cluster.
