variable "rg_name" {
  type = string
  default = "iac-terraform-azure-rg"
}

variable "location" {
  type = string
  default = "westus2"
}

variable "storage_account_name" {
  type = string
  default = "iac-terraform-azure-sa"
}

variable "service_plan_name" {
  type = string
  default = "iac-terraform-azure-sp"
}

variable "function_app_name" {
  type = string
  default = "iac-terraform-azure-fa"
}

variable "function_name" {
  type = string
  default = "hello"
}

variable "storage_container_name" {
  type = string
}