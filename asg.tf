##--AUTO SCALING GROUP--##

####################################################################
resource "aws_autoscaling_group" "asg_webserver" {
  name = "autoscaling_web"

  min_size          = 2
  desired_capacity  = 2
  max_size          = 3
  health_check_type = "ELB"
  load_balancers = [aws_elb.elastic_load_balancer.id]
  launch_configuration = aws_launch_configuration.webserver.name

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]
  metrics_granularity = "1Minute"

  vpc_zone_identifier = [
    aws_subnet.subnet_1_obligatorio.id,
    aws_subnet.subnet_2_obligatorio.id
  ]

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "name"
    value               = "asg_webserver"
    propagate_at_launch = true
  }
}
output "elb_dns_name" {
  value = aws_elb.elastic_load_balancer.dns_name
}
####################################################################
