resource "azuread_application" "deploying_to_the_cloud_demo" {
  display_name = "deploying_to_the_cloud_demo"
}

resource "azuread_service_principal" "deploying_to_the_cloud_demo" {
  application_id = azuread_application.deploying_to_the_cloud_demo.application_id
}

resource "azuread_service_principal_password" "deploying_to_the_cloud_demo" {
  service_principal_id = azuread_service_principal.deploying_to_the_cloud_demo.object_id
}

output "deploying_to_the_cloud_demo_sp_password" {
    sensitive = true
    value = azuread_service_principal_password.deploying_to_the_cloud_demo.value
}

output "deploying_to_the_cloud_demo_sp" {
    sensitive = true
    value = azuread_service_principal.deploying_to_the_cloud_demo.application_id  
}

output "deploying_to_the_cloud_demo_tenenat_id" {
    sensitive = true
    value = azuread_service_principal.deploying_to_the_cloud_demo.application_tenant_id  
}