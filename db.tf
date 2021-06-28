##--BASE DE DATOS--##

#############################################################
resource "aws_db_instance" "db_obligatorio" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  name                   = "db_webserver"
  username               = "admin"
  password               = "Password01"
  multi_az			         = "true"
  vpc_security_group_ids = [aws_security_group.db.id]
  db_subnet_group_name   = aws_db_subnet_group.db.id
  tags = {
    Name = "DB_Obligatorio"
  }
}

output "database_endpoint" {
  value = aws_db_instance.db_obligatorio.endpoint
}
#############################################################