resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name       = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_name   = azurerm_storage_account.sa.name
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "blob" {
  name                  = var.blob_name
  storage_account_name   = azurerm_storage_account.sa.name
  container_name         = azurerm_storage_container.container.name
  type                  = "BlockBlob"
  source                = var.blob_source
  # Opcjonalnie:
  # content_hash          = "<checksum>"
  # metadata              = { "key" = "value" }
}