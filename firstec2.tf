provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "test" {

  ami                    = "ami-0fa1de1d60de6a97e"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = var.key
  vpc_security_group_ids = ["sg-0433a571ba4e2ea4e"]
  tags = {
    Name    = "myinstance"
    Project = "Developement"
  }
}