data "aws_region" "current" {}

data "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"
}

data "template_cloudinit_config" "cloudinit" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = <<EOF
write_files:
  - content: |
      ${base64encode(file("${path.module}/files/nginx.conf.tpl"))}
    encoding: b64
    owner: root:root
    path: /etc/nginx/nginx.conf.tpl
    permissions: '0750'
EOF
  }

  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/files/bootstrap.sh", {
      CLUSTER_NAME       = var.cluster_name
      CONSUL_DATACENTER  = var.consul_datacenter
      ENCRYPTION_KEY     = var.encryption_key
      CONSUL_CLUSTER_TAG = var.consul_cluster_tag
    })
  }

}
