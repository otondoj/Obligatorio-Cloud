##--CONFIGURACIONES DE RED (VPC's, SUBNETS, GATEWAY Y ROUTE TABLES)--##

#######################################################################################
#----VPC----#

resource "aws_vpc" "vpc_obligatorio" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
 
  
  tags = {
    Name = "VPC Obligatorio"
  }
}
#######################################################################################
#----GATEWAY----#

resource "aws_internet_gateway" "gateway_obligatorio" {
  vpc_id = aws_vpc.vpc_obligatorio.id
}
#######################################################################################
#----SUBNET 1----#

resource "aws_subnet" "subnet_1_obligatorio" {
  vpc_id     = aws_vpc.vpc_obligatorio.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"
  
  tags = {
    Name = "Subred 1 "
  }
}

#----SUBNET 2----#

resource "aws_subnet" "subnet_2_obligatorio" {
  vpc_id     = aws_vpc.vpc_obligatorio.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = "true"
  
  tags = {
    Name = "Subred 2 "
  }
}
#######################################################################################
#----ROUTE TABLE----#

resource "aws_route_table" "route_table_obligaotrio" {
  vpc_id = aws_vpc.vpc_obligatorio.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway_obligatorio.id
  }

  tags = {
    Name = "Route Table Obligatorio"
  }
}

resource "aws_route_table_association" "route_table_asociar_vpc" {
  subnet_id      = aws_subnet.subnet_1_obligatorio.id
  route_table_id = aws_route_table.route_table_obligaotrio.id
}
resource "aws_route_table_association" "route_table_asociar2_vpc" {
  subnet_id      = aws_subnet.subnet_2_obligatorio.id
  route_table_id = aws_route_table.route_table_obligaotrio.id
}  
#######################################################################################

resource "aws_db_subnet_group" "db" {
subnet_ids = [aws_subnet.subnet_1_obligatorio.id, aws_subnet.subnet_2_obligatorio.id]
}
#######################################################################################