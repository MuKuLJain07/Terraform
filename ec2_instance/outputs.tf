# This files contains the outputs which you want your terraform to give after being applied.
output "instance_id" {
    description = "The ID of the EC2 instance"
    value       = aws_instance.test-instance-from-tf.id
}

output "instance_public_ip" {
    description = "The ID of the EC2 instance"
    value       = aws_instance.test-instance-from-tf.public_ip
}

output "instance_public_dns" {
    description = "The ID of the EC2 instance"
    value       = aws_instance.test-instance-from-tf.public_dns
}