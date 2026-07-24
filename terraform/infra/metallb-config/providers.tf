terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.38"
    }
  }
}

locals {
  kubeconfig_path = abspath(var.kubeconfig_path)
}

provider "kubernetes" {
  config_path = local.kubeconfig_path
}
