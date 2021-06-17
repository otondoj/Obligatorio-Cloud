
#----VPC----#
resource "aws_vpc" "vpc_obligatorio" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  
  tags = {
    Name = "VPC Obligatorio"
  }
}

#----GATEWAY----#
resource "aws_internet_gateway" "gateway_obligatorio" {
  vpc_id = aws_vpc.vpc_obligatorio.id
}

#----SUBNET 1----#
resource "aws_subnet" "subnet_1_obligatorio" {
  vpc_id     = aws_vpc.vpc_obligatorio.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  
  tags = {
    Name = "Subred 1 "
  }
}

#----SUBNET 2----#
resource "aws_subnet" "subnet_2_obligatorio" {
  vpc_id     = aws_vpc.vpc_obligatorio.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  
  tags = {
    Name = "Subred 2 "
  }
}

#----ROUTE TABLE----#
resource "aws_default_route_table" "route_table_obligaotrio" {
  default_route_table_id = aws_vpc.vpc_jo_225263.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway_jo_225263.id
  }

  tags = {
    Name = "Route Table Obligatorio"
  }
}
#######################################################################
#DE ACA PARA ABAJO HAY QUE REVISAR EL CODIGO Y ADAPTARLO AL NUESTRO   #
#(NO SE QUE HACEN ALGUNAS COSAS)                                      #
#######################################################################

resource "aws_route_table_association" "route_table_asociar_vpc" {
  subnet_id      = aws_subnet.subnet_obligatorio.id
  route_table_id = aws_route_table.route_obligatorio_publico.id
}
resource "aws_route_table_association" "route_table_asociar2_vpc" {
  subnet_id      = aws_subnet.subnet_obligatorio2.id
  route_table_id = aws_route_table.route_obligatorio_publico.id
}


resource "aws_security_group" "security_obligatorio" {
  name        = "security_obligatorio"
  description = "Permite las conexiones HTTP entrantes"
  vpc_id      = aws_vpc.vpc_obligatorio.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "security_obligatorio"
  }
}