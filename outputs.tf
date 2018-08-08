output "key_name" {
  description = "List of key names of instances"
  value       = ["${module.ec2-instance.key_name}"]
}

output "alb_dns" {
  description = "The DNS name of the load balancer."
  value       = "${module.alb.alb_dns}"
}

output "ec2-EIP" {
  description = "List of key names of instances"
  value       = ["${module.ec2-instance.EIP}"]
}

