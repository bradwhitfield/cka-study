variable "project" {
  default = "dockercertstudy"
}

variable "region" {
  default = "us-east1"
}

variable "is_preemptible" {
  default = true
}

variable "machine_type" {
  default = "n1-standard-2"
}

variable "master_count" {
  default = 1
}

variable "worker_count" {
  default = 0
}
