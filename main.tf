
provider "aws" {
  region = "${var.region}"
}


module "bucket" {

  source = "git@github.com:ThalisonCarlos/terraform.git//s3?ref=Aula6-modules"

  name = "${var.name_s3}-${var.env}"

  versioning = true

  tags = "${var.tags}"
}