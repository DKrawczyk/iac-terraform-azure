resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_storage_account" "sa" {
  name                = var.storage_account_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  account_tier       = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "sp" {
  name                = var.service_plan_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  kind                = "Linux"
  reserved            = true
  sku                 = "B1"
}

resource "azurerm_linux_function_app" "fa" {
  name                = var.function_app_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  runtime_version     = "3.x"
  storage_account_name = azurerm_storage_account.sa.name
  service_plan_id     = azurerm_service_plan.sp.id
}

resource "azurerm_function_app_function" "fa_function" {
  name                = "iac-terraform-azure-function"
  resource_group_name = azurerm_resource_group.rg.name
  function_app_name   = azurerm_linux_function_app.fa.name
  storage_container_name = "iac-terraform-azure-container"
  storage_account_name = azurerm_storage_account.sa.name
  file_path             = "index.js"
  function_name        = "hello"
}
