terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# The Data Lake
resource "google_storage_bucket" "raw_bhavcopy_lake" {
  name                        = "${var.project_id}-raw-bhavcopy"
  location                    = var.region
  force_destroy               = true
  uniform_bucket_level_access = true
}

# The Data Warehouse
resource "google_bigquery_dataset" "nse_market_data" {
  dataset_id                  = "nse_market_data"
  friendly_name               = "NSE Market Data"
  description                 = "Dataset for Indian Stock Market Bhavcopy Data"
  location                    = var.region
}