
variable "name" {
  
}

variable "tags" {
   type = "map"
   default = {}
}

variable "acl" {
  default = "private"
}

variable "versioning" {
  default = false
}

variable "create_object" {
  default = false
}

variable "object_source" {
  default = ""
}

variable "object_key" {
  default = ""
}




