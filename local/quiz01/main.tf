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
provider "local" {

}
resource "local_file" "data" {
  content  = "아무내용이나추가"
  filename = "data.txt"
}
data "local_file" "read_data" {
  filename = local_file.data.filename
  #depends_on = [ local_file.data  ]
}
resource "local_file" "copy_data" {
  content  = data.local_file.read_data.content
  filename = "copy_${data.local_file.read_data.filename}"
}
output "resource_copy_data_file_content" {
  value = local_file.copy_data.content
}
output "resource_copy_data_file_name" {
  value = local_file.copy_data.filename
}

output "data_file_content" {
  value = data.local_file.read_data.content
}
output "data_file_name" {
  value = data.local_file.read_data.filename
}
