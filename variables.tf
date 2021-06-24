variable "instance_type" {
  description = "EC2  instance type"
  default     = "t2.micro"
}

variable "ami" {
  description = "AMI"
  default     = "ami-00e87074e52e6c9f9"
}
variable "key_name" {
  description = "Nombre de Key"
  default     = "key-pair-ssh"
}


 