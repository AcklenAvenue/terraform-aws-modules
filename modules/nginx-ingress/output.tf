output "user_data" {
  description = "User data template"
  value       = data.template_cloudinit_config.cloudinit.rendered
}
