resource "aws_db_subnet_group" "this" {

  name = "${var.name}"
  subnet_ids  = ["${var.subnet_ids}"]

  tags = "${merge(map("Name", format("%s-%s", var.project, var.env)), var.default_tags)}"
}
