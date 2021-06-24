##--ELASTIC LOAD BALANCER--##

resource "aws_elb" "elastic_load_balancer" {
  name = "ElasticLoadBalancer"
  security_groups = [
    aws_security_group.security_group_obligatorio.id
  ]
  subnets = [
    aws_subnet.subnet_1_obligatorio.id,
    aws_subnet.subnet_2_obligatorio.id
  ]

##--VERIFICACION DEL ESTADO DE HTTP--##

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTP:80/"

  }

  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = "80"
    instance_protocol = "http"
  }

/* ##--INSTANCIAS CARGADAS AL LOAD BALANCER--##
  instances                   = [aws_instance.webserver_01.id,aws_instance.webserver_02.id ]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "webserver_01-elb"
    Name = "webserver_02-elb"
  }
} */

}