variable "kubeconfig_path" {
  description = "Path to the kubeconfig fetched by ansible/get_kubeconfig.yml."
  type        = string
  default     = "../../../ansible/artifacts/kubeconfig"
}
