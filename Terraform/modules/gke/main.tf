resource "google_container_cluster" "primary_cluster" {
  name       = var.cluster_name
  location   = var.cluster_location
  node_locations = [var.node_locations[0],var.node_locations[1]]
  network    = var.vpc_id
  subnetwork = var.subnet_id
  private_cluster_config {
    master_ipv4_cidr_block  = var.master_cidr
    enable_private_nodes    = true
    enable_private_endpoint = true
  }
  
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = "10.0.1.0/24"
    }
  }

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "/21"
    services_ipv4_cidr_block = "/21"
  }
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_service_account" "gcr_sa" {
  account_id   = "service-account-id1"
  display_name = "Service Account"
}
resource "google_project_iam_binding" "gcr_binding" {
  role    = "roles/storage.objectViewer"
  project = "onboardingproject1"
  members = [
    "serviceAccount:${google_service_account.gcr_sa.email}"
  ]
}

resource "google_container_node_pool" "primary_node_pool" {
  name       = "my-node-pool"
  location   = var.cluster_location
  cluster    = google_container_cluster.primary_cluster.name
  node_count = var.node_count

  node_config {
    preemptible  = false
    machine_type = var.machine_type
    disk_size_gb = 100
    disk_type    = "pd-standard"
    image_type   = "COS_CONTAINERD"

    service_account = google_service_account.gcr_sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
