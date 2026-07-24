variable "proxmox_api_url" {
  description = "Proxmox API URL."
  type        = string
  default     = "https://192.168.0.100:8006/api2/json"
}

variable "proxmox_tls_insecure" {
  description = "Allow self-signed Proxmox certificates."
  type        = bool
  default     = true
}

variable "proxmox_api_token_id" {
  description = "Proxmox API token ID."
  type        = string
  sensitive   = true
}

variable "proxmox_api_token_secret" {
  description = "Proxmox API token secret."
  type        = string
  sensitive   = true
}

variable "cloud_init_user" {
  description = "Cloud-init SSH user created on the Kubernetes VMs."
  type        = string
  default     = "jose"
}

variable "ssh_public_key" {
  description = "SSH public key added to the cloud-init user."
  type        = string
}
