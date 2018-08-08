resource "aws_security_group" "alb" {

  name        = "${var.project}-${var.env}-alb"
  vpc_id      = "${var.vpc_id}"
  lifecycle {
    create_before_destroy = true
  }

  ingress {
    from_port       = "80"                     
    to_port         = "80"
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
#    security_groups = ["${aws_security_group.alb.id}"]    ## ## Allow this from VPN IPs  
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${merge(map("Name", format("%s-%s-alb", var.project, var.env)), var.default_tags)}"
}


resource "aws_security_group" "ec2" {

  name        = "${var.project}-${var.env}-ec2"
  vpc_id      = "${var.vpc_id}"
  lifecycle {
    create_before_destroy = true
  }

  ingress {
    from_port       = "22"
    to_port         = "22"
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
#    security_groups = ["${var.security_groups}"]       ## Allow this from ALB
  }

  ingress {
    from_port       = "9000"
    to_port         = "9000"
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
#    security_groups = ["${var.security_groups}"]       ## Allow this from ALB
  }

  ingress {
    from_port       = "80"
    to_port         = "80"
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
#    security_groups = ["${aws_security_group.alb.id}"]     ## Allow this from ALB
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${merge(map("Name", format("%s-%s-ec2", var.project, var.env)), var.default_tags)}"
}

resource "aws_security_group" "rds" {

  name        = "${var.project}-${var.env}-rds"
  vpc_id      = "${var.vpc_id}"
  lifecycle {
    create_before_destroy = true
  }

  ingress {
    from_port       = "5432"
    to_port         = "5432"
    protocol        = "tcp"
    security_groups = ["${aws_security_group.ec2.id}"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${merge(map("Name", format("%s-%s-alb", var.project, var.env)), var.default_tags)}"
}

