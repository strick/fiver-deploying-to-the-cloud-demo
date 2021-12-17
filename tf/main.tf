# Initialises Terraform providers and sets their version numbers.

provider "azurerm" {
    subscription_id = var.subscription_id
    //client_id       = client_id
    //client_secret   = var.client_secret
    //tenant_id       = tenant_id
  features {}
}