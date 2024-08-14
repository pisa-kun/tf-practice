terraform {
  backend "gcs" {
    bucket = "koto-tema-saki-bucket" // your gcs bucket name
    prefix = "dev/setup"         // your gcs prefix
  }
}