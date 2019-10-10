variable "region" {
  default = "us-east-1"
  description = "Main Region"
}

variable "accessKey" {
  default = "xxxxxxxxxxxx"
}

variable "secretKey" {
  default = "xxxxxxxxxxxxxxxxxxxxxxxxxxx"
}

variable "ami" {
  default = "ami-00eb20669e0990cb4"
}

variable "type"{
  default = "t2.micro"
}

variable "tags" {
  type = "map"
  default = {
      "Name" = "java8"
      "Env" = "Dev"
  }
}




