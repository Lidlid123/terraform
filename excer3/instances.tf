provider "aws" {
  region = var.region
}



resource "aws_key_pair" "mykey" {
  key_name   = var.key_name
  public_key = file("mykey.pub")
}

resource "aws_security_group" "my-sg" {
  name_prefix = "example-"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_instance" "example" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.mykey.key_name
  vpc_security_group_ids = [aws_security_group.my-sg.id]

  tags = {
    Name = "example-instance"
  }

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"



  }

  provisioner "remote-exec" {
    inline = [
      " sudo chmod +x /tmp/script.sh",
      " sudo /tmp/script.sh",
    ]
  }

    connection {
      type     = "ssh"
      user     = "ubuntu"
      private_key = file("mykey")
      host     = self.public_ip
    }



}