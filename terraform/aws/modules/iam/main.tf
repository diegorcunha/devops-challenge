resource "aws_iam_role" "ecs_task_execution_role" {
  name               = lower("${var.app_name}-ecs-task-execution-role")
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}


data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "this" {
  name = lower("${var.app_name}-rule_engine-ssm_policy")
  path = "/"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "ssm:Describe*",
          "ssm:Get*",
          "ssm:List*"
        ],
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = aws_iam_policy.this.arn
}
