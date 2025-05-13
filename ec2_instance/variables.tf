# This files contains the varibales which your terraform file will be using.

variable "ec2_instance_type" {
    description = "The type of EC2 instance to create"
    type        = string
    default     = "t2.micro"
}

variable "ec2_instance_storage" {
    description = "The storage size for the EC2 instance in GB"
    type        = number
    default     = 8
}

variable "ubuntu-ami" {
    description = "The AMI ID for the Ubuntu image"
    type        = string
    default     = "ami-0e35ddab05955cf57"
}