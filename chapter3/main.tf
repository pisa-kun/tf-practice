terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.40.0"
    }
  }

  backend "gcs" {
    bucket = "sumiri-bucket"
    #workspace
    key = "workspace/terraform.tfstate"
  }
}

provider "google" {
#   credentials = file("ダウンロードしたJSONファイルへのフルパス")

  project = var.project_id
  region  = var.region
  zone    = "asia-northeast1-a"
}

# resource "google_storage_bucket" "terraform-state-store"{
#   name = var.bucket_name
#   location = var.region
#   storage_class = "REGIONAL"

#   versioning {
#     enabled = true
#   }

#   lifecycle_rule {
#     action{
#       type="Delete"
#     }
#     condition {
#       num_newer_versions = 5
#     }
#   }
# }


resource "google_compute_network" "vpc_network" {
  name = "terraform-network-test"
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "default" {
  name          = "my-custom-subnet"
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.vpc_network.id
}

# Create a single Compute Engine instance
resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = var.machine_type
  tags         = ["ssh", "test"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  # Install Flask
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python3-pip rsync; pip install flask"

  network_interface {
    subnetwork = google_compute_subnetwork.default.id

    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}