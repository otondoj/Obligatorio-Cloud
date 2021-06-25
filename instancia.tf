provider "aws" {
    region  = "us-east-1"
    profile = "default"
}

##--INSTANCIA 1--##

resource "aws_instance" "webserver_01" {
    ami             = var.ami
    instance_type   = var.instance_type
    key_name        = var.key_name
    subnet_id       = aws_subnet.subnet_1_obligatorio.id
    security_groups = [aws_security_group.security_group_obligatorio.id]
    user_data    = file("C:/Terraform/Obligatorio/webserver.sh")
    
    tags = {
      Name      = "Web Server 01"
      terraform = "True"
    }
    connection {
    type = "ssh"
    user = "centos"
    private_key = file("C:/Terraform/Obligatorio/key-pair-ssh.pem")
    host = self.public_ip
    }
  } 

##--INSTANCIA 2--##

resource "aws_instance" "webserver_02" {
    ami             = var.ami
    instance_type   = var.instance_type
    key_name        = var.key_name
    subnet_id       = aws_subnet.subnet_2_obligatorio.id
    security_groups = [aws_security_group.security_group_obligatorio.id]
    user_data    = file("C:/Terraform/Obligatorio/webserver.sh")
    
    tags = {
      Name      = "Web Server 02"
      terraform = "True"
    }
    connection {
    type = "ssh"
    user = "centos"
    private_key = file("C:/Terraform/Obligatorio/key-pair-ssh.pem")
    host = self.public_ip
    }
  } 

