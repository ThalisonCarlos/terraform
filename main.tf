provider "aws" {
  region     = "${var.region}"
  access_key = "${var.accessKey}"
  secret_key = "${var.secretKey}"
}

resource "aws_instance" "web" {
  ami = "${var.ami}"
  instance_type = "${var.type}"

  tags = "${var.tags}"
}


