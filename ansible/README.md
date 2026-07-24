# Kubernetes deployment

This folder deploys the VMs defined in `../terraform/main.tf` as a kubeadm
cluster:

![Kubernetes cluster diagram](../images/k8s-cluster.svg)

- control plane: `k8s-master` at `192.168.0.60`
- workers: `k8s-worker-0..2` at `192.168.0.61..63`

The playbook assumes the Terraform cloud-init user is available over SSH:
`jose`, with passwordless sudo or a sudo password supplied to Ansible.

## Deploy

From this directory:

```sh
ansible-playbook k8s_setup.yml
```

If sudo needs a password:

```sh
ansible-playbook k8s_setup.yml --ask-become-pass
```

## Fetch kubeconfig

After the control plane is initialized, fetch the admin kubeconfig from the
master:

```sh
ansible-playbook get_kubeconfig.yml
```

The file is written to `artifacts/kubeconfig`, which is ignored by git.

## What it does

- prepares Debian nodes for Kubernetes
- disables swap
- installs and configures containerd with systemd cgroups
- installs `kubelet`, `kubeadm`, and `kubectl` from the selected `pkgs.k8s.io`
  minor-version repository
- initializes the control plane with kubeadm
- installs Calico through the Tigera operator
- joins worker nodes if they are not already joined

Cluster defaults live in `group_vars/k8s_cluster.yml`.
