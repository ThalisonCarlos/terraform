
provider "aws" {
  region = "${var.region}"
}

data "terraform_remote_state" "web" {
  backend = "s3"
  config = {
    bucket = "thalison-bucket-dev"
    key    = "ec2/ec2.tfstate"
    region = "${var.region}"
  }
}

locals {
  ami         = "teste"
}


module "bucket" {

  source = "git@github.com:ThalisonCarlos/terraform.git//s3?ref=Aula6-modules"

  name = "${var.name_s3}-${var.env}-${local.ami}"

  versioning = true

  tags = "${var.tags}"
}