provider "google" {
  project = "df-dna-insight-npe-5fd9"
  region  = "us-east1"
  zone    = "us-east1-b"
}

resource "google_storage_bucket" "analytics-bucket-dsao" {
  name          = "ingestion-terraform-bucket"
  location     = "US"

  website {
  main_page_suffix = "index.html"
  not_found_page   = "404.html"
  }
}

