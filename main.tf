module "sg" {
  source = "./sg"

  env = "${var.env}"
  project = "${var.project}"
  region = "${var.region}"
  default_tags = "${var.default_tags}"
  vpc_id   = "${data.terraform_remote_state.vpc.vpc_id}"

  tags = "${merge(map("Name", format("%s-%s-sg", var.project, var.env)), var.default_tags)}"
}

module "rds_subnet_group" {
  source = "./rds_subnet_group"

  name = "${var.project}-${var.env}"
  subnet_ids  = ["${data.terraform_remote_state.vpc.private_subnets_ids}"]
  project 	      = "${var.project}"
  env      = "${var.env}"
  region = "${var.region}"
  default_tags = "${var.default_tags}"

  tags = "${merge(map("Name", format("%s-%s", var.project, var.env)), var.default_tags)}"
}

module "rds_instance" {
  source = "./rds_instance"

  env = "${var.env}"
  project = "${var.project}"
  region = "${var.region}"
  default_tags = "${var.default_tags}"
  identifier = "${var.project}-${var.env}"
  name                                = "${var.project}"
  username                            = "${var.project}"
  password                            = "${var.password}"
  vpc_security_group_ids = ["${module.sg.aws_security_group_rds_id}"]
  db_subnet_group_name   = "${module.rds_subnet_group.this_db_subnet_group_id}"

  tags = "${merge(map("Name", format("%s-%s", var.project, var.env)), var.default_tags)}"
}

module "ec2-instance" {
  source = "./ec2-instance"

  env = "${var.env}"
  project = "${var.project}"
  region = "${var.region}"
  default_tags = "${var.default_tags}"
  subnet_id   = "${data.terraform_remote_state.vpc.public_subnets_ids.0}"
  vpc_security_group_ids = ["${module.sg.aws_security_group_ec2_id}"]

  tags = "${merge(map("Name", format("%s-%s-ec2", var.project, var.env)), var.default_tags)}"
}

module "alb" {
  source = "./alb"

  env = "${var.env}"
  project = "${var.project}"
  region = "${var.region}"
  default_tags = "${var.default_tags}"
  vpc_id    = "${data.terraform_remote_state.vpc.vpc_id}"
  subnets            = ["${data.terraform_remote_state.vpc.public_subnets_ids}"]
  target_id   = "${module.ec2-instance.id}"
  security_groups = ["${module.sg.aws_security_group_alb_id}"]
  tags = "${merge(map("Name", format("%s-%s-alb", var.project, var.env)), var.default_tags)}"
}


