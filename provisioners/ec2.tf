resource "aws_instance" "provisioner" {
  ami = "ami-03265a0778a880afb"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${self.private_ip} > inventory"
  }
}

resource "aws_instance" "remote" {
  ami = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  security_groups = ["sg-02843ace28930c937"]
  subnet_id = "subnet-09863c54177764565"

  connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install nginx -y",
      "sudo systemctl start nginx"
    ]
  }
}