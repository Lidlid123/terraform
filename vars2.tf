variable "region" {

  default = "us-east-1"
}

variable "zone1" {

  default = "us-east-1a"

}

variable "ec2_type" {
  type = map(any)

  default = {
    free1 = "t2.micro"
    free2 = "t2.small"
  }

}



variable "amis" {
  type = map(any)
  default = {
    us-east-1 = "ami-0fa1de1d60de6a97e"
    us-east-2 = "ami-007855ac798b5175e"
  }

}


variable "key" {

  default = "production"

}


variable "ssh_access_sg" {
  default = "sg-0433a571ba4e2ea4e"

}