resource "aws_ecs_task_definition" "nginx" {
  family       = "${replace(local.name_prefix, ".", "-")}-nginx"
  network_mode = "host"
  volume {
    name      = "nginx-config"
    host_path = "/etc/nginx/nginx.conf.tpl"
  }
  execution_role_arn    = data.aws_iam_role.ecs_task_execution_role.arn
  container_definitions = <<DEFINITION
[
    {
        "name": "nginx",
        "image": "hndoss/ecs-nginx-reverse-proxy:latest",
        "cpu": 10,
        "memoryReservation": 128,
        "essential": true,
        "portMappings": [
            {
                "containerPort": 80,
                "hostPort": 80
            }
        ],
        "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
            "awslogs-group": "${var.log_group}",
            "awslogs-region": "${data.aws_region.current.name}",
            "awslogs-stream-prefix": "nginx"
          }
        },
        "command": [],
        "mountPoints": [
            {
               "containerPath" : "/etc/nginx/nginx.conf.tpl",
               "sourceVolume" : "nginx-config"
            }
        ],
        "environment": [
          {"name": "SERVICE_NAME", "value": "nginx"}
        ]
    }
]
DEFINITION
  tags                  = merge(local.tags, { Name = "${local.name_prefix}-nginx" })
}

resource "aws_ecs_service" "nginx-service" {
  name                 = "nginx"
  cluster              = var.cluster_id
  task_definition      = aws_ecs_task_definition.nginx.arn
  iam_role             = aws_iam_role.ecs_service_role.arn
  force_new_deployment = true
  desired_count        = 2

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "nginx"
    container_port   = 80
  }
}
