# MetalLB

This Terraform root installs MetalLB and its CRDs from the official MetalLB Helm
chart.

Run this after Ansible has initialized the cluster and fetched kubeconfig:

```sh
terraform init
terraform apply
```

Then apply `../metallb-config`.
