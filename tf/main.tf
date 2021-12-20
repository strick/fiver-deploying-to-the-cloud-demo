# Initialises Terraform providers and sets their version numbers.

provider "azurerm" {
    subscription_id = var.subscription_id
 //   client_id       = azuread_service_principal.deploying_to_the_cloud_demo.application_id  
 //   client_secret   = azuread_service_principal_password.deploying_to_the_cloud_demo.value
 //   tenant_id       = azuread_service_principal.deploying_to_the_cloud_demo.application_tenant_id
  features {}
}