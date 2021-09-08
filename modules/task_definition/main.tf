provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}

resource "aws_ecs_task_definition" "service" {
  family = "henoheno_backend"
  requires_compatibilities = ["FARGATE"]
  network_mode = "awsvpc"
  cpu = 256
  memory = 512
  execution_role_arn = "arn:aws:iam::745850811950:role/ecsTaskExecutionRole"
  container_definitions = jsonencode([
    {
      name = "api"
      image = "745850811950.dkr.ecr.ap-northeast-1.amazonaws.com/henoheno:latest"
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort = 80
        }
      ]
    }
  ])
}
