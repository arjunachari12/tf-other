terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 0.1.2"
}

provider "azurerm" {
  features {
  }
}
variable "vm_count" {
  type    = number
  default = 3
}
variable "min_vm_count" {
  type    = number
  default = 1
}
variable "max_vm_count" {
  type    = number
  default = 2
}
locals {
  constrained_vm_count = max(var.min_vm_count, min(var.max_vm_count, var.vm_count))
}

resource "azurerm_virtual_machine" "example" {
  # ...other arguments...

  count = local.constrained_vm_count
}


