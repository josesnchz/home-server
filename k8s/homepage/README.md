# Homepage

This Helm chart deploys Homepage with a `LoadBalancer` service on port `80`.

Install it with:

```sh
  helm upgrade --install homepage ./k8s/homepage \
    --namespace homepage \
    --create-namespace \
    -f k8s/homepage/values.yaml \
    -f k8s/homepage/config.yaml
```

The default config is stored in a ConfigMap and mounted at `/app/config`.

For Docker integrations, `dockerSocket.enabled` is available but disabled by
default. This kubeadm cluster uses containerd, so mounting
`/var/run/docker.sock` is usually not useful unless Docker is installed on the
target nodes.
