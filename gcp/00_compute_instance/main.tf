# Provider and project
provider "google" {
  project = "df-dna-insight-npe-5fd9"
  region  = "us-east1"
  zone    = "us-east1-b"
}

# Compute instances
resource "google_compute_instance" "vm_instance" {
  name          = "terraform-instance"
  machine_type  = "f1-micro"

  tags = ["df-analytics-insight-vpc-allow-http","df-analytics-insight-vpc-allow-icmp","http-server"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network      	= "df-analytics-insight-vpc"
  }

  metadata_startup_script =     <<-EOF
                                #!/bin/bash
                                apt install apache2 -y
                                echo "Hello Analytics" > /var/www/html/index.html
                                systemctl start apache2
                                EOF

}
