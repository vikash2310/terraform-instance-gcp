terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}



provider "google" {
  credentials = file("anime-ab856-c14a9c3f0a69.json")




  project = "anime-ab856"

  region = "us-central1"

  zone = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  tags = ["web","dev"]


  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable"
    }
  }


  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}

