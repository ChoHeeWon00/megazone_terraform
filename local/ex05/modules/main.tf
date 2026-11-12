terraform {
  required_version = "~>1.15.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = ">=2.7"
    }
  }
  backend "local" {
    path = "tfstate/terraform.tfstate"
  }
}
provider "local" {}

locals {
  username = var.user_name
}
// ex05/modules : init, fmt, plan, apply
resource "local_file" "user" {
  filename = var.user_name
  content  = "이름 : ${local.username}"
}
