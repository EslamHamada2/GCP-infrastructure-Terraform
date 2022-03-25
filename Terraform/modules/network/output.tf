output "vpc_output"{
    value = google_compute_network.main_vpc.id
}


output "subnet_output"{
    value = google_compute_subnetwork.main_subnet.id
}
