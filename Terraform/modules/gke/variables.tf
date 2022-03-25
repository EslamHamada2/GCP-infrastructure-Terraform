variable "cluster_name" {
    type = string
}

variable "cluster_location" {
    type    = string
    default = "us-central1"
}

variable "node_locations" {
    type = list
    default = ["us-central1-c","us-central1-f"]
}

variable "vpc_id" {
    type = string
}

variable "subnet_id" {
    type = string
}

variable "master_cidr" {
    type = string
    default = "172.16.0.0/28"
}

variable "machine_type" {
    type    = string
    default = "e2-standard-2"
}

variable "node_count" {
    type    = number
    default = 2
}
