output "test_string_out" {
  description = "문자열 출력"
  value       = var.test_string
}
output "test_list_out" {
  description = "list 출력"
  value       = var.test_list[0] #var.test_list
}
// 입력 시 { key : value }
output "test_map_out" {
  description = "map 출력"
  value       = var.test_map["public_ip"][0] #var.test_map
}
output "test_object_out" {
  description = "object 출력"
  value       = var.test_object
}


output "all_output_01" {
  value = "${var.test_number}, ${var.test_string}, ${var.test_map["public_ip"][0]}"
}

output "all_output_02" {
  value = <<-eot
   번호 : ${var.test_number}
   문자 : ${var.test_string}
   아이피 : ${var.test_map["public_ip"][0]}
  eot
}







