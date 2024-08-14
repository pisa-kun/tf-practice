terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.40.0"
    }
  }

  backend "gcs" {
    bucket = "sumiri-bucket"
  }
}

provider "google" {
#   credentials = file("ダウンロードしたJSONファイルへのフルパス")

  project = var.project_id
  region  = var.region
  zone    = "asia-northeast1-a"
}