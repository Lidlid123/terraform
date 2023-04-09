

resource "aws_instance" "myec2" {

  ami               = var.amis[var.region]
  availability_zone = var.zone1
  instance_type     = var.ec2_type["free2"]
  key_name          = var.key

  vpc_security_group_ids = [var.ssh_access_sg]
  tags = {
    "Name" = "testEC2"
  }

}