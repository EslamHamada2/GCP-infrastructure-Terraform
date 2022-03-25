resource "google_compute_network" "main_vpc" {
  name = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_firewall" "iap_firewall" {
  name    = "allow-iap-only"
  network = google_compute_network.main_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["80", "22"]
  }
  direction     = "INGRESS"
  source_ranges = ["35.235.240.0/20"]
}
####################################################
resource "google_compute_subnetwork" "main_subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  region        = "us-central1"
  network       = google_compute_network.main_vpc.id
}

resource "google_compute_router" "main_router" {
  name          = var.router_name
  region        = google_compute_subnetwork.main_subnet.region
  network       = google_compute_network.main_vpc.id 
}
resource "google_compute_router_nat" "nat_gateway" {
  name                               = var.nat_name
  router                             = google_compute_router.main_router.name
  region                             = google_compute_router.main_router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.main_subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}
