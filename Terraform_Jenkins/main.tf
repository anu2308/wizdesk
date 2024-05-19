variable "region" {
  default = "us-east-1"
}


# Provider
provider "aws" {
  region  = var.region
}


# DATA
data "aws_ami" "aws_ubuntu" {
  most_recent = true
  owners      = ["amazon"]

}

# RESOURCES
# Ami

resource "aws_instance" "aws_ubuntu" {
  instance_type          = "t2.micro"
  ami                    = "ami-0e001c9271cf7f3b9"
  user_data              = file("userdata.tpl")
}

# Default VPC
resource "aws_default_vpc" "default" {

}

# Security group
resource "aws_security_group" "demo_sg" {
  name        = "demo_sg"
  description = "allow ssh on 22 & http on port 80"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
