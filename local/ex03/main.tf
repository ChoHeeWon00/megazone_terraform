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

variable "test_number" {
  description = "사용자 입력값"
  type        = number
  default     = 789
}
output "test_number_out" {
  description = "사용자 입력값 출력"
  value       = var.test_number
}
#init, fmt, plan, apply





