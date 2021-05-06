terraform {
    required_providers {
      google = {
          source = "hashicorp/google"
          version = "3.5.0"
      }
    }
}

provider "google"{
    credentials = file(var.credentials_file)

    project = var.project
    region = var.region
    zone = var.zone
}

resource "google_compute_network" "vpc_network" {
  name = "TerraformNetwork"
}

resource "google_compute_instance" "vm_instance" {
  name = "TerraformIVMInstance"
  machine_type = var.machine_types[var.environment]
  tags = ["web", "dev"]

  boot_disk {
    initialize_params {
        image = "debian-cloud/debian-9"
    }
  }
  network_interface{
    network = google_compute_network.vpc_network.name
  }
}
