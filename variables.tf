variable "instance_type" {
  description = "EC2  instance type"
  default     = "t2.micro"
}

variable "ami" {
  description = "AMI"
  default     = "ami-0055d58addfe009d0"
}
variable "key_name" {
  description = "Nombre de Key"
  default     = "key-pair-ssh"
}


 