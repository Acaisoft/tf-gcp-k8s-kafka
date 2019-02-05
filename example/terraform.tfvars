terragrunt = {
  terraform {
    source = "../"
    # Configure source as repository link
    # source = "git::git@github.com:Acaisoft/tf-gcp-k8s-kafka.git?ref=0.1.0"
  }
  
  remote_state {
    backend = "gcs"
    config {
      # Bucket must exists
      bucket  = "bucket-name"
      prefix  = "k8s-kafka/state"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# MODULE PARAMETERS
# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
# ---------------------------------------------------------------------------------------------------------------------

provider = {
  # Path to file with GCP service account key 
  credentials_path = "./service-account.json"
  # GCS project name
  project          = "project-name"
  region           = "europe-west1"
}


gke_cluster_remote_state = {
  # Bucket with gke cluster state
  bucket  = "bucket-name"
  prefix = "bucket-name"
}