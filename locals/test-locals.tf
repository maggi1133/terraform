# resource "aws_instance" "conditions" {
#   count = 10
#   ami = local.ami_id #devops-practice in us-east-1
#   instance_type = var.instance_names[count.index] == "MongoDB" || var.instance_names[count.index] == "MySQL" ? "t3.medium" : "t2.micro"
#   tags = {
#     Name = var.instance_names[count.index]
#   }
# }

# resource "aws_route53_record" "record" {
#   count = 10
#   zone_id = var.zone_id
#   name    = "${var.instance_names[count.index]}.${var.domain}" #interpolation
#   type    = "A"
#   ttl     = 1
#   records = [aws_instance.conditions[count.index].private_ip]
# }

resource "aws_key_pair" "deployer" {
  key_name   = "devops-pub"
  public_key = local.key_public

}

resource "aws_instance" "file-function" {
  ami = local.ami_id #devops-practice in us-east-1
  instance_type = local.instance_type
  key_name = aws_key_pair.deployer.key_name
}

# MongoDB Cart Catalogue User Redis MySQL RabbitMQ Shipping Payment Web