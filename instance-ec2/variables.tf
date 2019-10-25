variable "region" {
  default = "us-east-1"
}

variable "image_ec2" {
  default = "ami-00eb20669e0990cb4"
}

variable "type_ec2" {
  default = "t2.micro"
}

variable "tags" {
  type = "map"
  default = {
    "Name" = "states-test"
  }
}


