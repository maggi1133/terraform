output "private_ips" {
  value = aws_instance.conditions[*].private_ip
}