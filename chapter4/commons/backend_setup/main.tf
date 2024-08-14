resource "google_storage_bucket" "terraform_state" {
  name     = "koto-tema-saki-bucket" // your gcs bucket name
  location = "ASIA"
  versioning {
    enabled = true
  }
}