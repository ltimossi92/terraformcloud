locals {
  vpc_id            = "vpc-0c210ef556db0ff73"
  subnet_id         = "subnet-09a31c4567ccb92d5"
  ssh_user          = "ubuntu"
  key_name          = "devops"
  private_key_path  = "./devops.pem"
}

provider "aws" {
  region = var.region
}

resource "aws_security_group" "nginx" {
  name = "nginx_access"
  vpc_id = local.vpc_id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "nginx" {
  ami                         = var.ami
  subnet_id                   = local.subnet_id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  security_groups             = [aws_security_group.nginx.id]
  key_name                    = local.key_name

  provisioner "remote-exec" {
    inline = ["echo Done!"]

    connection {
      type        = "ssh"
      user        = local.ssh_user
      private_key = file(local.private_key_path)
      host        = aws_instance.nginx.public_ip
    }
  }

  tags = {
    Name = var.instance_name
  }
}