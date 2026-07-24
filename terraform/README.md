# Terraform

This directory is split into independent Terraform roots so deployment order is
explicit.

Deployment order:

1. create nodes from `nodes`
2. run Ansible from `../ansible`
3. apply Kubernetes infrastructure from `infra/metallb`
4. apply infrastructure custom resources from `infra/metallb-config`

## Nodes

From `nodes`, create a local `terraform.tfvars` from
`terraform.tfvars.example`, then run:

```sh
terraform init
terraform apply
```

`terraform.tfvars` should not be committed because it contains the Proxmox API
token secret.

## Infrastructure

Apply `infra/metallb` only after Ansible has initialized the cluster and
fetched `../ansible/artifacts/kubeconfig`. Apply `infra/metallb-config` after
MetalLB has installed its CRDs.
