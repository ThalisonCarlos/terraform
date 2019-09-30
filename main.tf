provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAWHXY45LWY6T6WFNG"
  secret_key = "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"
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-1231231231231312312"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
