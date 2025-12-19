variable "aws_region" {
  default = "ap-south-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "allowed_ports" {
  type    = list(number)
  default = [22, 80, 443]
}

variable "key_name" {
  type = string
}

variable "instance_name" {
  default = "nginx-terraform-instance"
}
