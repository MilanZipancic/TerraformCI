terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
}

terraform { 
  cloud { 
    
    organization = "tutorial_org_mz"

    workspaces { 
      name = "remotestate"
    } 
  } 
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "tr_rg_001"
  location = "Central US"
}

resource "azurerm_storage_account" "storage" {
  name                     = "storagemzipancic"
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
  resource_group_name      = azurerm_resource_group.rg.name
}
