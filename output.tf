output "instance_id" {
  description = "IDs of the Ubuntu EC2 instances"
  value = [
    aws_instance.web1.id,
    aws_instance.web2.id
  ]
}

output "public_ips" {
  description = "Public IP addresses of the web servers"
  value = [
    aws_instance.web1.public_ip,
    aws_instance.web2.public_ip
  ]
}

output "instance_public_dns" {
  description = "Public DNS names of the web servers"

  value = [
    aws_instance.web1.public_dns,
    aws_instance.web2.public_dns,
  ]
}