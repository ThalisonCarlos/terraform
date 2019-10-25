
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

  ami = "${var.image_ec2}"

  instance_type = "${var.type_ec2}"

  tags = "${var.tags}"
}



