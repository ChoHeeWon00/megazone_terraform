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
  project_name = "test-project"
  env          = var.env
}
output "local_out" {
  value = local.project_name
}
output "local_out_env" {
  value = local.env
}
variable "env" {
  description = "dev, staging, prod 중 입력"
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "staging", "prod"], var.env)
    error_message = "env는 dev, staging, prod 중 하나 입력"
  }
}
locals {
  ins_type = var.env == "dev" ? "t3.large" : "t3.micro"
  loc_env  = local.env
}

output "type_env" {
  value = "${local.ins_type} = ${local.loc_env}"
}

variable "input_env" {
  type    = string
  default = "staging"
}
// var.input_env(dev, sta)
// local.env_config[var.input_env]
locals {
  config = local.env_config[var.input_env]
  env_config = {
    dev = {
      type    = "개발 환경 구동(t3.micro)"
      content = "프로젝트 개발 단계"
    }
    staging = {
      type    = "운영 전 검증 구동"
      content = "서비스 전 마지막 테스트 단계"
    }
    prod = {
      type    = "운영 환경(실 서비스-t3.large)"
      content = "사용자/고객들이 서비스를 사용할 수 있음"
    }
  }
}

output "current_config" {
  value = local.config
}

resource "local_file" "setting" {
  filename = "settings_${var.input_env}.txt"
  content  = <<-EOT
    TYPE : ${local.config.type}
    CONTENT : ${local.config.content}
    EOT
}


variable "user_name" {
  type    = list(string)
  default = ["111", "222", "333"]
}
locals { // [111.txt, 222.txt], [111@test.com, 222@test.com]
  user_files = [for name in var.user_name : "${name}.txt"]
  user_email = [for name in var.user_name : "${name}@test.com"]
}
output "users_file" {
  value = local.user_files
}
output "users_email" {
  value = local.user_email
}
// [172.16.101.0/24, 172.16.105.0/24, 172.16.201.0/24]
resource "local_file" "users" {
  count    = length(local.user_files)
  filename = local.user_files[count.index]
  content  = "이메일 : ${local.user_email[count.index]}"
}
