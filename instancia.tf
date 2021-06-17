provider "aws" {
    region  = "us-east-1"
    profile = "default"
}
resource "aws_instance" "ec2_jo_225263" {
    ami = "ami-00e87074e52e6c9f9"
    instance_type = "t2.micro"
    key_name = "key-pair-ssh"
    subnet_id = aws_subnet.vpc_subnet_jo_225263.id

    tags = {
      Name      = "ec2_jo_225263"
      terraform = "True"
    }
}


