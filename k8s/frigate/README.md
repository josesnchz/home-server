# Frigate



This values file deploys the official Frigate Helm chart with a `LoadBalancer`
service on port `80`.

It requests `192.168.0.202`, so MetalLB must have that IP in its address pool.

Install it with:

```sh
helm repo add blakeblackshear https://blakeblackshear.github.io/blakeshome-charts/
helm upgrade --install grafana grafana-community/grafana \
  --namespace grafana \
  --create-namespace \
  --values k8s/grafana/values.yaml
```

Get the generated admin password:

```sh
kubectl get secret --namespace grafana grafana \
  -o jsonpath="{.data.admin-password}" | base64 --decode; echo
```

Then open:

```text
http://192.168.0.200:3000
```
