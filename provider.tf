terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.12.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "077db605-017b-40d2-82f1-5572039ac98d"
}