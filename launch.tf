##--LAUCH CONFIGURATION--##

#############################################################################
resource "aws_launch_configuration" "webserver" {
  name_prefix = "webserver"

  image_id = var.ami 
  instance_type = var.instance_type
  key_name = var.key_name

  security_groups = [aws_security_group.security_group_obligatorio.id]
  associate_public_ip_address = true

  user_data = file("C:/Terraform/Obligatorio/webserver.sh")

  lifecycle {
    create_before_destroy = true
  }
}
#############################################################################