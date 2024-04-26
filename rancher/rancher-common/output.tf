# Outputs

output "rancher_url" {
  value = "https://${var.rancher_server_dns}"
}

output "custom_cluster_command" {
  value       = rancher2_cluster_v2.quickstart_workload.cluster_registration_token.0.insecure_node_command
  description = "Docker command used to add a node to the quickstart cluster"
}

output "custom_cluster_windows_command" {
  value       = rancher2_cluster_v2.quickstart_workload.cluster_registration_token.0.insecure_windows_node_command
  description = "Docker command used to add a windows node to the quickstart cluster"
}

output "custom_rke_cluster_command" {
  value       = rancher2_cluster.quickstart_workload_rke.cluster_registration_token.0.node_command
  description = "Docker command used to add a node to the quickstart cluster"
}
