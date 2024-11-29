terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "#Provide"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "#Provide"
}

provider "random" {}