output "k8s_master_ip" {
  description = "Control-plane node IP address."
  value       = "192.168.0.60"
}

output "k8s_worker_ips" {
  description = "Worker node IP addresses."
  value       = ["192.168.0.61", "192.168.0.62", "192.168.0.63"]
}
