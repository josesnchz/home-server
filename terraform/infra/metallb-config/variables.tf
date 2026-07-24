variable "kubeconfig_path" {
  description = "Path to the kubeconfig fetched by ansible/get_kubeconfig.yml."
  type        = string
  default     = "../../../ansible/artifacts/kubeconfig"
}

variable "metallb_address_pool" {
  description = "LAN addresses MetalLB can assign to LoadBalancer services."
  type        = list(string)
  default     = ["192.168.0.200/32", "192.168.0.201/32"]
}
