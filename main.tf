provider "aws" {
  region     = "us-east-1"
  access_key = "xxxxxxxxxxx"
  secret_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-1231231231231312312"
  acl    = "private"

  tags = {
    Name        = "My bucket customizado"
    Environment = "PROD"
  }
}
