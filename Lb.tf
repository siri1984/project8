resource "aws_lb" "external-elb" {
  name               = "External-ELB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.WebApp-SG.id]
  subnets            = [aws_subnet.WebApp-Sub-1.id, aws_subnet.WebApp-Sub-2.id]
}
resource "aws_lb_target_group" "external-elb" {
  name     = "ALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.project8-vpc.id
}
resource "aws_lb_target_group_attachment" "external-elb1" {
  target_group_arn = aws_lb_target_group.external-elb.arn
  target_id        = aws_instance.WebServer1.id
  port             = 80

  depends_on = [
    aws_instance.WebServer1,
  ]
}
resource "aws_lb_target_group_attachment" "external-elb2" {
  target_group_arn = aws_lb_target_group.external-elb.arn
  target_id        = aws_instance.WebServer2.id
  port             = 80

  depends_on = [
    aws_instance.WebServer2,
  ]
}
resource "aws_lb_listener" "external-elb" {
  load_balancer_arn = aws_lb.external-elb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.external-elb.arn
  }
}
