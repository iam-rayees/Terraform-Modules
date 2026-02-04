resource "aws_lb" "test" {
  name               = "${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.sg_id
  subnets            = var.public_subnet_id

  tags = {
    Environment = var.environment
  }
}

resource "aws_lb_target_group" "test" {
  name     = var.tgname
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

}

resource "aws_lb_target_group_attachment" "test" {
  count            = length(local.all_instances)
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = local.all_instances[count.index]
  port             = 80
}

