# Rancher resources

# Initialize Rancher server
resource "rancher2_bootstrap" "admin" {
  depends_on = [
    helm_release.rancher_server
  ]

  provider = rancher2.bootstrap

  password  = var.admin_password
  telemetry = true
}

# Create custom managed cluster for quickstart
resource "rancher2_cluster_v2" "quickstart_workload" {
  provider = rancher2.admin

  name               = var.workload_cluster_name
  kubernetes_version = var.workload_kubernetes_version
}

# Create custom managed cluster for quickstart
resource "rancher2_cluster" "quickstart_workload_rke" {
  provider = rancher2.admin

  name               = var.workload_rke_cluster_name

  rke_config {
    kubernetes_version = var.workload_rke_kubernetes_version
    network {
      plugin = "canal"
    }
  }
}
