##--ELASTIC FILE SYSTEM--##

############################################################################
resource "aws_efs_file_system" "efs_obligatorio" {
  creation_token = "efs_obligatorio"

  tags = {
    Name = "EFS Obligatorio"
  }
}
############################################################################

resource "aws_efs_mount_target" "mount" {
    depends_on = [aws_efs_file_system.efs_obligatorio]
    file_system_id = aws_efs_file_system.efs_obligatorio.id
    subnet_id = aws_instance.webserver_01.subnet_id
    security_groups = [aws_security_group.security_group_obligatorio.id]
}
############################################################################