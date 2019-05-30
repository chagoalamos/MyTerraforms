provider "google" {
  project = "df-dna-insight-npe-5fd9"
}

resource "google_dataproc_cluster" "dataproc-cluster" {
  name	 = "terraform-analytics-dataproc-cluster"
  region = "us-central1"

  cluster_config {
    gce_cluster_config {
      subnetwork = "df-analytics-insight-vpc"
      internal_ip_only = true
      service_account = "tf-df-dna-insight-npe@df-dna-insight-npe-5fd9.iam.gserviceaccount.com"
    }
  }
}

# Submit an example spark job to a dataproc cluster
resource "google_dataproc_job" "spark" {
    region       = "us-central1"
    force_delete = true
    placement {
        cluster_name = "terraform-analytics-dataproc-cluster"
    }

    spark_config {
        main_class    = "org.apache.spark.examples.SparkPi"
        jar_file_uris = ["file:///usr/lib/spark/examples/jars/spark-examples.jar"]
        args          = ["1000"]

        properties    = {
            "spark.logConf" = "true"
        }

        logging_config {
            driver_log_levels = {
                "root" = "INFO"
            }
        }
    }
}

# Check out current state of the jobs
output "spark_status" {
    value = "${google_dataproc_job.spark.status.0.state}"
}
