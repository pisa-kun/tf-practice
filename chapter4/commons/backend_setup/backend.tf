terraform {
  backend "gcs" {
    bucket = "koto-tema-saki-bucket" // your gcs bucket name
    prefix = "commons/backend_setup"         // your gcs prefix
  }
}