variable "user_each" {
  type = list(string)
  default = [ "aaa1", "bbb1", "ccc1" ]
}

resource "local_file" "users_each" {
  for_each = toset(var.user_each) # [ "aaa", "bbb", "ccc" ]
  filename = "${each.value}.txt"
  content = "사용자 : ${each.value}"
}

variable "subnets" {
  description = "서브넷 구성"
  type = map( object({
    cidr = string
    public = bool
  }) )

  default = {
    "public_01" = { cidr = "172.16.101.0/24", public = true }
    "public_02" = { cidr = "172.16.201.0/24", public = true }
    "private_01" = { cidr = "172.16.105.0/24", public = false }
    "private_02" = { cidr = "172.16.205.0/24", public = false }
  }
}
locals {
  subnets = var.subnets
}
output "subnets_out" {
  value = local.subnets
}
#"public_01" = { cidr = "172.16.101.0/24", public = true }
#"public_02" = { cidr = "172.16.201.0/24", public = true }
#"private_01" = { cidr = "172.16.105.0/24", public = false }
#"private_02" = { cidr = "172.16.205.0/24", public = false }
resource "local_file" "subnets_each" {
  for_each = local.subnets
  filename = each.key
  content = "cidr : ${each.value["cidr"]}, public : ${each.value.public}"
}

output "public-sub-01" {
  value = local_file.subnets_each["public_01"].content
}

