# MetalLB configuration

This Terraform root creates MetalLB custom resources with the official
HashiCorp Kubernetes provider.

Apply `../metallb` first so the `metallb.io` CRDs exist before this root is
planned:

```sh
terraform init
terraform apply
```
