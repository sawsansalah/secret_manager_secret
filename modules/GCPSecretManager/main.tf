terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
  }
}
provider "google" {
  project     = var.project
  region      = var.region
  zone        = var.zone
}
# ----------------------------------------------------------------------------------------
#     Create a random string 
# ----------------------------------------------------------------------------------------

resource "random_string" "secret_value" {
  length  = 16
  special = true
}

# ----------------------------------------------------------------------------------------
#     Create a secret in GCP Secret Manager
# ----------------------------------------------------------------------------------------

resource "google_secret_manager_secret" "secret" {
  secret_id = var.secret_id

  labels = {
    secretmanager = var.secret_label
  }

  replication {
    auto {} #Google automatically replicates the secret data across multiple regions for high availability
  }
}

# ----------------------------------------------------------------------------------------
#     Create a version of our secret
# ----------------------------------------------------------------------------------------

resource "google_secret_manager_secret_version" "secret-version-basic" {
  secret      = google_secret_manager_secret.secret.id
  secret_data = random_string.secret_value.result
 
}

