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
variable "username" {
  description = "이름 입력"
  type = string
}
module "my_module" {
  source = "./modules"
  user_name = var.username
  user_addr = "개똥별"
}