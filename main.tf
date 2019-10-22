
provider "aws" {
  region = "us-east-1"
}

resource "random_id" "bucket" {
  byte_length = 8
}

resource "random_id" "bucket-2" {
  byte_length = 4
}


module "buket" {
  source = "./s3"

  create_object = true
   
  name = "my-bucket-${random_id.bucket.hex}"

  versioning = true

  object_key = "files/${random_id.bucket.dec}.txt"

  object_source = "arquivo.txt"

  tags = {
    "Name" = "Meu Bucket de Anotações"
  }
  
}

module "buket-2" {
  source = "./s3"

  name = "my-bucket-${random_id.bucket-2.hex}"
  
}

