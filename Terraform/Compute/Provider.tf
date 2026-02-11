terraform {
  required_providers {
    ibm = {
      source  = "ibm-cloud/ibm"
      version = ">= 1.12.0"
    }
  }
}

provider "ibm" {
  # ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
}