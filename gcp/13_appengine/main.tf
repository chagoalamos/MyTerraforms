provider "google" {
  project = "df-dna-insight-npe-5fd9"
  region  = "us-east1"
}

resource "google_app_engine_application" "analyticsapp" {
  project	= "df-dna-insight-npe-5fd9"
  location_id	= "us-east1"
}
