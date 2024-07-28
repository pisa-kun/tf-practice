provider "google" {
  credentials = file("key.json") // 「SA のキーを取得する」で生成したkey.jsonまでのパスを指定
  project     = var.project_id // variable.tf を参照してる
  region      = var.default_region
}

resource "google_cloud_run_service" "sample-app-001" {
  name     = var.project_id
  location = var.default_region

  template {
    spec {
      containers {
        image = "asia-northeast1-docker.pkg.dev/${var.project_id}/sample-app-001/${var.docker_version}"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}