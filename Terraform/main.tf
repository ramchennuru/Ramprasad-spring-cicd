provider "aws" {
    region = var.region
}

resource "aws_instance" "first_ec2_with_terraform" {
	ami = "ami-076e3a557efe1aa9c"
	instance_type = var.instance_type
	tags = {
		Name = "ram-ec2"
	}
}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "All"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

variable "region"{
    default="ap-south-1"
}

variable "instance_type"{
    default="t2.micro"
}