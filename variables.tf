variable "env" { default = "qa" }
variable "project" { default = "sonarqube" }
variable "region" { default = "us-east-1" }

variable "default_tags" {
  default = {}
}

variable "vpc_id" {
  default = ""
}

variable "subnets" {
  default = []
}

variable "instance_type" {
    default     = "t2.small"
}

variable "root_device_size" {
  default     = "12"
}

variable "pub_key_path" { default = "id_rsa.pub" }

variable "tags" {
  default = {}
}

variable "name_prefix" { default = "" }

variable "security_groups" { default = [] }

variable "vpc_zone_identifier" { default = [] }

variable "subnet_ids" { default = [] }

variable "security_group_ids" { default = [] }

variable "name" {
  default = "sonarqube"
}

variable "username" {
  default = "sonarqube"
}

variable "password" {
  default = "neworgpassword123QW!$" 
}

variable "port" {
  default = "5432"
}

variable "db_subnet_group_name" { default = "" }

variable "identifier" { default = ""  }

variable "target_id" { default = ""  }

