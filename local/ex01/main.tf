resource "local_file" "abc" {
content  = "abc!!!"
       filename = "${path.module}/abc.txt"
}
resource "local_file" "abc2" {
  content = "abc2"
  filename = "abc2.txt"
}
resource "local_file" "abc3" {
  content = "abc3"
  filename = "../abc3.txt"
}