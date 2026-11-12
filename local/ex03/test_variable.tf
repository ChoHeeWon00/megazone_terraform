variable "test_string" {
  description = "문자열 입력"
  type        = string
  default     = "value"
}
variable "test_list" {
  description = "list 입력"
  type        = list(any)
  default     = ["172.16.101.0/24", "값"]
}
variable "test_map" {
  description = "map 입력"
  type        = map(any)
  default = {
    public_ip : ["172.16.101.0/24", "201.0/24"],
    private_ip : ["172.16.105.0/24", "205.0/24"]
  }
}

variable "test_object" {
  description = "object 입력"
  type = object({
    name = string, age = number
  })
  default = { name : "홍길동", age : 20 }
}

