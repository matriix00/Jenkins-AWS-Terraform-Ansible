output "vpc_id" {
  value = aws_vpc.your_vpc.id
}

output "public_subnet" {
  value = aws_subnet.public_subnet.id
}

output "instance_ip" {
  value = aws_instance.jenkins_server.public_ip
}
