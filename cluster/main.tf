provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}

resource "google_compute_instance" "master" {
  name         = "master"
  count        = "${var.master_count}"
  machine_type = "${var.machine_type}"
  zone         = "us-east1-b"

  tags = ["master", "kubernetes"]

  boot_disk {
    initialize_params {
      image = "ubuntu-1604-xenial-v20180612"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  scheduling {
    preemptible       = "${var.is_preemptible}"
    automatic_restart = false
  }

  metadata = {
    user-data = "${file("templates/master.tpl")}"
  }
}

resource "google_compute_instance" "worker" {
  name         = "worker-${count.index}"
  count        = "${var.worker_count}"
  machine_type = "${var.machine_type}"
  zone         = "us-east1-b"

  tags = ["worker", "kubernetes"]

  boot_disk {
    initialize_params {
      image = "ubuntu-1604-xenial-v20180612"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  scheduling {
    preemptible       = "${var.is_preemptible}"
    automatic_restart = false
  }

  metadata = {
    user-data = "${file("templates/worker.tpl")}"
  }
}
