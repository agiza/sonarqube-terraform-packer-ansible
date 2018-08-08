output "id" {
  description = "List of IDs of instances"
  value       = "${aws_instance.ec2.id}"
}

output "key_name" {
  description = "List of key names of instances"
  value       = ["${aws_instance.ec2.*.key_name}"]
}

output "EIP" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = ["${aws_eip.eip.*.public_ip}"]
}

