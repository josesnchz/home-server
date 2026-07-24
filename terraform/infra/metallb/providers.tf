terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.0"
    }
  }
}

locals {
  kubeconfig_path = abspath(var.kubeconfig_path)
}

provider "helm" {
  kubernetes = {
    config_path = local.kubeconfig_path
  }
}
