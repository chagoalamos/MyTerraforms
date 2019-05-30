provider "google" {
  project = "df-dna-insight-npe-5fd9"
  region  = "us-central1"
}

resource "google_composer_environment" "tf-composer-environment" {
  name   = "tf-composer-environment"
  region = "us-central1"
}
