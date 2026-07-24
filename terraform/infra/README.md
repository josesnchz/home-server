# Kubernetes infrastructure

Apply these Terraform roots only after:

1. the nodes are created from `../nodes`
2. Ansible has initialized Kubernetes with `../../ansible/k8s_setup.yml`
3. Ansible has fetched kubeconfig with `../../ansible/get_kubeconfig.yml`

Then apply infra in this order:

```sh
cd metallb
terraform init
terraform apply

cd ../metallb-config
terraform init
terraform apply
```
