# provider "aws" {
#   profile = "personal_acc"   
#   region  = "ap-south-1"      
# }

resource "aws_s3_bucket" "my_bucket_1" {
  bucket = "my-tf-test-bucket"
}
