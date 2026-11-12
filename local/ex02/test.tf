terraform {
  required_version = "~>1.15.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = ">=2.7"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
  backend "local" {
    path = "test/terraorm.tfstate"
  }
}
provider "local" {

}
#provider "aws" {
#  region = "aaaaa"
#}

resource "local_file" "abc" {
  content  = "abc!!"
  filename = "${path.module}/abc.txt"
}
resource "local_file" "abc2" {
  content  = local_file.abc.filename    #"abc2"
  filename = "${path.module}/abc2.txt"
  #depends_on = [ local_file.abc ]
}

data "local_file" "read_abc" {
  filename = "abc.txt"
}
output "my_print" {
  value = "단순 출력 용도"
}







