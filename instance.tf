resource "aws_instance" "web1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id = aws_subnet.subnet1.id
  vpc_security_group_ids = [ aws_security_group.SG.id ]
  key_name = "terraform-web-server"

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("terraform-web-server")
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [ 
        "sudo apt update -y",
        "sudo apt install apache2 -y",
        "sudo systemctl enable apache2",
        "sudo systemctl start apache2"
    ]
  }

  tags = {
    Name = "web1-terraform-instance"
  }
}

resource "aws_instance" "web2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id = aws_subnet.subnet2.id
  vpc_security_group_ids = [ aws_security_group.SG.id ]
  key_name = "terraform-web-server"

  tags = {
    Name = "web2-terraform-instance"
  }
}