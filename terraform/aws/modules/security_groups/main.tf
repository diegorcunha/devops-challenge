locals {
  resources_name = var.name
}

######################################################################
# for ecs
######################################################################
resource "aws_security_group" "allow_ecs_sg" {
  name        = "${local.resources_name}-ECS_security_group"
  description = "ECS security group"
  vpc_id      = var.vpc
  tags = {
    Name = "${local.resources_name}-ecs-security_group"
  }
}

resource "aws_security_group_rule" "from-ECS" {
  type              = "egress"
  from_port         = 8888
  to_port           = 8888
  protocol          = "-1"
  security_group_id = aws_security_group.allow_ecs_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}
