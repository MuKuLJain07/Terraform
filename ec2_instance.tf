# provider "aws" {
#     profile = "personal_acc"   
#     region  = "ap-south-1"      
# }

resource "aws_instance" "example" {
    ami           = "ami-0c02fb55956c7d316"
    instance_type = "t2.micro"
}