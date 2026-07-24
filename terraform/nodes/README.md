# Kubernetes nodes

This Terraform root creates the Proxmox VMs used by the Kubernetes cluster.

Create a local `terraform.tfvars` from `terraform.tfvars.example`, then run:

```sh
terraform init
terraform apply
```

`terraform.tfvars` should not be committed because it contains the Proxmox API
token secret.
