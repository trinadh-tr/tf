/*
 * Copyright 2019: Thomson Reuters. All Rights Reserved. Proprietary and Confidential information of Thomson Reuters.
 * Disclosure, Use or Reproduction without the written authorization of Thomson Reuters is prohibited.
 */

/*
Name: target-group.tf
Description: Creating AWS target group 
*/


# Crearing AWS target group
resource "aws_lb_target_group" "a205923-target-group" {
  name = "${local.resource_name}-${var.dns_type}"
  port = var.port_number
  protocol    = var.protocol
  target_type = var.target_type
  vpc_id      = local.vpc_id
  
  deregistration_delay = var.deregistration_delay
  load_balancing_algorithm_type = var.load_balancing_algorithm_type
  slow_start = var.slow_start
  stickiness {
      enabled = var.stickiness_enable
      type = var.stickiness_type
  }
  health_check {
      interval = var.interval
      timeout = var.timeout
      path  = "${var.health_check_path}"
      unhealthy_threshold = var.unhealthy_threshold
      healthy_threshold = var.healthy_threshold
  }
   tags = local.required_tags
}

