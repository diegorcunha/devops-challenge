######################
# ECS FARGATE
######################

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.app_name}-${var.environment}"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
  tags = {
    Name = "${var.app_name}-${var.environment}-ecs cluster"

  }
}

###########################################
# task definition
###########################################
resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                   = "${lower(var.app_name)}-${var.environment}"
  execution_role_arn       = var.ecs_task_execution_role_arn
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = "256"
  cpu                      = "0.5"

  container_definitions = jsonencode([
    {
      name      = var.app_name
      image     = var.ecr_url
      cpu       = "0.5"
      memory    = "256"
      essential = true
      portMappings = [
        {
          containerPort = 8888
        }
      ]
    }
  ])
}

################################################################################
# Service
################################################################################

resource "aws_ecs_service" "private_service" {
  name            = "${var.app_name}-Service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets          = var.private_subnets
    assign_public_ip = true
    security_groups = [var.security_group]
  }
}

################################################################################
# IAM
################################################################################

resource "aws_iam_role" "this" {
  name = "${var.app_name}-${var.environment}-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      },
    ]
  })
  tags = {
    tag-key = "tag-value"
  }
}
