variable "env" {}

variable "project" {}

variable "region" {}

variable "default_tags" { type = "map" }

variable "tags" {}

variable "identifier" {}

variable "allocated_storage" {
  default = "20"
}

variable "engine" {
  default = "postgres"
}

variable "engine_version" {
  default = "10.3"
}

variable "instance_class" {
  default = "db.t2.micro"
}

variable "name" {
  default = "sonar"
}

variable "username" {
  default = "sonar"
}

variable "password" {}

variable "port" {
  default = "5432"
}

variable "db_subnet_group_name" {}

variable "multi_az" {
  default     = false
}

variable "publicly_accessible" {
  default     = false
}

variable "allow_major_version_upgrade" {
  default     = false
}

variable "auto_minor_version_upgrade" {
  default     = false
}

variable "apply_immediately" {
  default     = true
}

variable "backup_retention_period" {
  default     = 3
}

variable "final_snapshot_identifier" {
  default     = false
}

variable "skip_final_snapshot" {
  default     = true
}

variable "vpc_security_group_ids" { type = "list" }

