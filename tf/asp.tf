# Generate a random integer to create a globally unique name
resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

# Create the Linux App Service Plan
resource "azurerm_app_service_plan" "appserviceplan" {
  name                = "webapp-asp-${random_integer.ri.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  
  //kind                = "Windows"
  //reserved            = false # Must be false (the default value) for Windows plans
  
  kind                  = "Linux"
   reserved               = true

  sku {
    tier = "Free"
    size = "F1"
  }
}
# Create the web app, pass in the App Service Plan ID, and deploy code from a public GitHub repo
resource "azurerm_app_service" "webapp" {
  name                = "webapp-${random_integer.ri.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id
/*  source_control {
    repo_url           = "https://github.com/strick/fiver-deploying-to-the-cloud-demo"
    branch             = "main"
    //manual_integration = true
    //use_mercurial      = false
  }
*/
  site_config {
// Linux took over 5 minutes to deploy, test out windows to see if it's faster
      linux_fx_version = "node|14-lts"
      //windows_fx_version = "node|12-lts"
      use_32_bit_worker_process = true  // Must use for free teir

  }

  app_settings = {
    # Must exactly match the value of this setting you get by creating a web app
    # with "az webapp create -r <windows_fx_version>"
    WEBSITE_NODE_DEFAULT_VERSION = "14.13"
//WEBSITE_NODE_DEFAULT_VERSION = "12.13.0"
    PORT = var.PORT,
    #SCM_DO_BUILD_DURING_DEPLOYMENT=true

    
  }
}