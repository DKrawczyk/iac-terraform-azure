variable "resource_group_name" {
  type = string
  default = "my-rg"
  }

variable "location" {
  type = string
  default = "West US"
}

variable "storage_account_name" {
  type = string
}

variable "container_name" {
  type = string
}

variable "blob_name" {
  type = string
}

variable "blob_source" {
  type = string
}
