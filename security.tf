##--SECURITY GROUP WEBSERVER--##

####################################################################
resource "aws_security_group" "security_group_obligatorio" {
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
####################################################################

##--SECURITY GROUP RDS--##

####################################################################
resource "aws_security_group" "db" {
  name   = "DB_web"
  vpc_id = aws_vpc.vpc_obligatorio.id
  }

resource "aws_security_group" "nfs" {
  name   = "NFS"
  vpc_id = aws_vpc.vpc_obligatorio.id

 ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
####################################################################