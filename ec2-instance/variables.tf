variable "env" {}

variable "project" {}

variable "region" {}

variable "default_tags" { type = "map" }

variable "tags" {}

variable "ami" {
  default     = "ami-759bc50a"
}

variable "instance_count" {
  description = "ID of AMI to use for the instance, supports 1 for now"
  default     = "1"
}

variable "instance_type" {
  description = "The type of instance to start"
    default     = "t2.small"
}

variable "key_name" { default = "" }

variable "subnet_id" {}

variable "disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection"
  default     = "false"
}

variable "associate_eip" {
  default = "true"
}

variable "root_device_size" {
  description = "Customize details about the root block device of the instance"
  default     = "12"
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = "list"
  default = []
}

variable "pub_key_path" {
  default = "id_rsa.pub"
}

