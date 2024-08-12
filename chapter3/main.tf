terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.40.0"
    }
  }
}

provider "google" {
#   credentials = file("ダウンロードしたJSONファイルへのフルパス")

  project = var.project_id
  region  = var.region
  zone    = "asia-northeast1-a"
}

resource "google_storage_bucket" "terraform-state-store"{
  name = var.bucket_name
  location = var.region
  storage_class = "REGIONAL"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action{
      type="Delete"
    }
    condition {
      num_newer_versions = 5
    }
  }
}