resource "local_file" "my_file" {
    filename = "automated.txt"
    content = "This is an automated file created by Terraform."
    file_permission = "777"
}