output "aws_security_group_alb_id" {
  value       = "${aws_security_group.alb.id}"
}

output "aws_security_group_ec2_id" {
  value       = "${aws_security_group.ec2.id}"
}

output "aws_security_group_rds_id" {
  value       = "${aws_security_group.rds.id}"
}

