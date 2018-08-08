data "aws_ami" "sonarqube_ami" {
  most_recent      = true

  filter {
    name   = "name"
    values = ["sonarqube-packer-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "ec2_kp" {
  key_name   = "${var.project}_${var.env}_kp"
  public_key = "${file("${path.module}/${var.pub_key_path}")}"
}

resource "aws_instance" "ec2" {

  ami                    = "${data.aws_ami.sonarqube_ami.id}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${var.subnet_id}"
  key_name               = "${aws_key_pair.ec2_kp.key_name}"
  vpc_security_group_ids =  ["${var.vpc_security_group_ids}"]

  disable_api_termination              = "${var.disable_api_termination}"
  root_block_device {
    volume_size           = "${var.root_device_size}"
  }

  tags = "${merge(map("Name", format("%s-%s-ec2", var.project, var.env)), var.default_tags)}"
}

resource "aws_eip" "eip" {
  count    = "${var.associate_eip ? 1 : 0}"
  instance = "${aws_instance.ec2.id}"
  vpc      = true
}

