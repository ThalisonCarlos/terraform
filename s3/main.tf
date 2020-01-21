
provider "aws" {
  region = "${var.region_aws}"
}

resource "aws_s3_bucket" "b" {
  bucket = "${var.bucket_name}"
  
  versioning {
    enabled = true
  }

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}