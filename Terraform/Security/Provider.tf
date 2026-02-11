
terraform {
  required_providers {
    ibm = {
      source  = "ibm-cloud/ibm"
      version = ">= 1.12.0"
    }
  }
}

# Configure the IBM Provider
provider "ibm" {
  region           = var.region
  # ibmcloud_api_key = var.ibmcloud_api_key
}