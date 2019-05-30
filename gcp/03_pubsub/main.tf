#provider "google" {
#  project = "df-dna-insight-npe-5fd9"
#  region  = "us-east1"
#  zone    = "us-east1-b"
#}
provider "google" {
  project = "df-dna-insight-npe-5fd9"
  region  = "us-east1"
  zone    = "us-east1-b"
}

resource "google_pubsub_topic" "analytics-terraform-topic" {
  name	  = "terraformed-topic"

  labels  = {
    mypub = "sub"
  }
}
