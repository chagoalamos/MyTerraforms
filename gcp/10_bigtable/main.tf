provider "google" {
  project = "df-dna-insight-npe-5fd9"
  region  = "us-central1"
}

resource "google_bigtable_instance" "terraform-roduction-instance" {
  name         = "terraform-bigtable-instance"
  instance_type = "PRODUCTION"

  cluster {
    cluster_id   = "tf-instance-cluster"
    zone         = "us-central1-a"
    num_nodes    = 3
    storage_type = "SSD"
  }
}
