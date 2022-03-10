resource "null_resource" "test_create" {
  provisioner "local-exec" {
    command = "echo 'This is a test' > test-file"
  }
}
