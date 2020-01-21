provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket = "thalison-bucket-dev"
    key    = "ec2/ec2.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "web" {
  ami           = "${var.ami_instance}"
  instance_type = "${var.type}"

  key_name = "thalison-key"

  tags = {
    Ambiente = "DEV"
    Funcao   = "estudos"
  }

  provisioner "file" {

    source      = "teste.log"
    destination = "/tmp/file.log"

    connection {
      type        = "${local.con_type}"
      user        = "${local.con_user}"
      timeout     = "${local.con_timeout}"
      private_key = "${local.con_private_key}"
    }
  }

  provisioner "remote-exec" {

    inline = [
      "sleep 20",
      "echo \"[UPDATING THE SYSTEM]\"",
      "sudo yum update -y",
      "echo \"[INSTALLING THE HTTPD]\"",
      "sudo yum install -y httpd",
      "echo \"[STARTING THE HTTPD]\"",
      "sudo service httpd start",
      "echo \"[FINISHING]\"",
      "sudo chkconfig httpd on",
      "sleep 10",
    ]

    connection {
      type        = "${local.con_type}"
      user        = "${local.con_user}"
      timeout     = "${local.con_timeout}"
      private_key = "${local.con_private_key}"
    }
  }
}

 locals {
    con_type        = "ssh"
    con_user        = "thalison"
    con_timeout     = "1m"
    con_private_key = "${file("~/Downloads/thalison-key.pem")}"
  }

resource "null_resource" "null" {
  provisioner "local-exec" {
    command = "echo ${aws_instance.web.id}:${aws_instance.web.public_ip} >> public_ips.txt"
  }
}


resource "tls_private_key" "pkey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "keypair" {
  key_name   = "thalison-2-${var.env}"
  public_key = "${tls_private_key.pkey.public_key_openssh}"
}


