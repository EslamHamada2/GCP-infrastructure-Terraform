variable "vm_name" {
  type = string
}

variable "vm_type" {
  type    = string
  default = "e2-micro"
}

variable "zone" {
  type    = string
  default = "us-central1-c"
}

variable "image" {
  type    = string
  default = "debian-cloud/debian-9"
}

variable "vpc_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "subnet_cidr" {
  type = string
}

variable "router_name" {
  type = string
}

variable "nat_name" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "cluster_location" {
  type    = string
  default = "us-central1"
}

variable "master_cidr" {
  type    = string
  default = "172.16.0.0/28"
}

variable "machine_type" {
  type    = string
  default = "e2-standard-2"
}

variable "node_count" {
  type    = number
  default = 1
}

variable "bucket_name" {
  type    = list(any)
  default = ["randombucketname0", "randombucketname1", "randombucketname2"]
}

variable "bucket_location" {
  type = string
}

variable "bucket_class" {
  type    = string
  default = "STANDARD"
}

variable "dataset_id" {
  type    = list(any)
  default = ["dataset0", "dataset1", "dataset2"]
}

variable "dataset_location" {
  type = string
}
