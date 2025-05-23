# key-pair login      (already added to AWS)
# resource "aws_key_pair" "deployer" {
#   key_name   = "deployer-key"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
# }




# VPC & security group
resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my_security_group" {
    name = "automated_security_group"
    description = "Allow SSH and HTTP traffic"
    vpc_id = aws_default_vpc.default.id                             # iterpolation

    # inbound rules --> ingress
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        description = "Allow SSH access"
        cidr_blocks = ["0.0.0.0/0"]
    }   
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        description = "HTTP access"
        cidr_blocks = ["0.0.0.0/0"]
    }   
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        description = "HTTPS access"
        cidr_blocks = ["0.0.0.0/0"]
    }   
    ingress {
        from_port = 8000
        to_port = 8000
        protocol = "tcp"
        description = "default nginx port"
        cidr_blocks = ["0.0.0.0/0"]
    }   


    # outbound rules --> egress
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        description = "Allow all outbound traffic"    
    }

    tags = {
        Name = "automated_security_group"
    }
}
 
# ec2 instance
resource "aws_instance" "test-instance-from-tf" {
    count         = 1
    ami           = var.ubuntu-ami
    instance_type = var.ec2_instance_type
    key_name      = "id_rsa"                                          # reference the key already in AWS
    security_groups = [aws_security_group.my_security_group.name]     # reference the security group created above
    root_block_device {
        volume_size = var.ec2_instance_storage
        volume_type = "gp3"
        delete_on_termination = true
    }
    tags = {
        Name = "test-instance-from-tf"
    }
    user_data = file("install_nginx.sh")                                # reference the script to install nginx
}