terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~> 4.0.0"
        }
    }
    required_version = ">= 1.9.0"
}

provider "azurerm" {
    features {}
}


resource "azurerm_resource_group" "rg" {
    name = "rg-hands-on"
    location = "East US"
    tags = {
        environment = "development"
    }

}

resource "azurerm_storage_account" "sa" {
    
    name = "sa-hands-on"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    account_tier = "Standard"
    account_replication_type = "LRS"
    tags = {
        environment = "development"
    }
}