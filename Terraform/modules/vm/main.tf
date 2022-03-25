resource "google_service_account" "instance_sa" {
  account_id   = "instance-service-account-id"
  display_name = "Service Account2"
}

resource "google_project_iam_binding" "container_admin" {
  project = "onboardingproject1"
  role    = "roles/container.admin"
  depends_on = [
    google_service_account.instance_sa
  ]
  members = [
    "serviceAccount:${google_service_account.instance_sa.email}"
  ]
}


resource "google_project_iam_binding" "buckets_binding" {
  role    = "roles/storage.objectAdmin"
  project = "onboardingproject1"
  members = [
    "serviceAccount:${google_service_account.instance_sa.email}"
  ]
}

resource "google_project_iam_binding" "bigquery_binding" {
  role    = "roles/bigquery.dataEditor"
  project = "onboardingproject1"
  members = [
    "serviceAccount:${google_service_account.instance_sa.email}"
  ]
}

resource "google_compute_instance" "testing_vm" {
  name         = var.vm_name
  machine_type = var.vm_type     
  zone         = var.zone 

  boot_disk {
    initialize_params {
      image = var.image 
    }
  }
  network_interface {
    network    = var.vpc_id
    subnetwork = var.subnet_id
  }
  service_account {
    email  = google_service_account.instance_sa.email
    scopes = ["cloud-platform"]
  }
}
