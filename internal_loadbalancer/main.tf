resource "aws_lb" "internal_loadbalancer" {
  name               = "app-loadbalancer"
  internal           = var.internal
  load_balancer_type = "application"
  security_groups    = [var.sg_internal_lb]
  subnets            = var.subnet_internal_lb

  enable_deletion_protection       = false
  enable_http2                     = true
  enable_cross_zone_load_balancing = true


  tags = {
    Environment = "${var.environment}"
  }
}

#Target group of load balancer
resource "aws_lb_target_group" "internal_target_group" {
  name     = "internal-target-group"
  port     = var.target_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  target_group_health {
    dns_failover {
      minimum_healthy_targets_count      = "1"
      minimum_healthy_targets_percentage = "off"
    }

    unhealthy_state_routing {
      minimum_healthy_targets_count      = "1"
      minimum_healthy_targets_percentage = "off"
    }
  }
}

#listener for load balancer
resource "aws_lb_listener" "internal_http" {
  load_balancer_arn = aws_lb.internal_loadbalancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
   type             = "forward"
   target_group_arn = aws_lb_target_group.internal_target_group.arn
  }
}