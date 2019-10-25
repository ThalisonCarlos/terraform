variable "region" {
  default = "us-east-1"
}

variable "env" {
  default = "dev"
}

variable "tags" {
  type = "map"
  default = {
    "Name" = "states-test"
  }
}

variable "name_s3" {
  default = "thalison-bucket"
}

