/*
 * Copyright 2019: Thomson Reuters. All Rights Reserved. Proprietary and Confidential information of Thomson Reuters.
 * Disclosure, Use or Reproduction without the written authorization of Thomson Reuters is prohibited.
 */

/*
Name: variable-target-group.tf
Description: defining the variables requried for target-group
*/

data "aws_caller_identity" "current" {}
data "aws_vpc" "vpc_id" {}

# common variables for this service
variable "asset_id" {
  description = "project asset id"
  type        = string
  default     = "a205923"
}
variable "project_name" {
  description = "name of the project "
  type        = string
  default     = "akk"
}
variable "financial_identifier" {
  description = "financial_identifier id"
  type        = string
  default     = "66497"
}


# service  variables
variable "service_name" {
  description = "name of the service"
  type        = string
}
variable "port_number" {
  description = "defining the Port number "
  type = string
}

variable "protocol" {
  description = "defining the protocal type"
  type = string
  default = "HTTP"
}
variable "target_type" {
  description = "defining the target_type "
  type = string
  default = "ip"  
}

variable "deregistration_delay" {
  description = "defining deregistration_delay"
  type = string
  default = "20"
}
variable "load_balancing_algorithm_type" {
  description = "defining load_balancing_algorithm_type"
  type = string
  default = "round_robin"
}
variable "slow_start" {
  description = "defining slow_start"
  type = string
  default = "0"
}
variable "stickiness_enable" {
    type = bool
    description = "defining stickiness_enable status"
    default = false
} 
variable "stickiness_type" {
  description = "defining stickiness_type"
  type = string
  default = "lb_cookie"
}
variable "interval" {
  description = "interval for health check"
  type = string
  default = "30"
}
variable "timeout" {
  description = "time out for heath check "
  type = string
  default = "5"
}
variable "health_check_path" {
  description = "path for health check only service name needed"
  type = string  
}
variable "unhealthy_threshold" {
  description = "health check unhealthy_threshold "
  type = string
  default = "2"
}
variable "healthy_threshold" {
  description = "health check healthy_threshold"
  type = string
  default = "2"
}
variable "dns_type" {
  description = "DNS type for lb(public or private)"
  #type = list(string)
}


# defining the local variables for this service
locals {
  resource_name         = "${var.asset_id}-${var.project_name}-${var.service_name}-${terraform.workspace}"
  project_tags = {
    "tr:resource-owner"               = "${data.aws_caller_identity.current.user_id}"
    "tr:environment-type"             = "${terraform.workspace}"
    "tr:asset-insight-id" = var.asset_id
    "tr:project-name"                 = var.project_name
    "tr:financial-identifier"         = var.financial_identifier
    "tr:terraform-workspace" = terraform.workspace
  }
  vpc_id = "${data.aws_vpc.vpc_id.id}"
  custom_tags   = { "tr:custom" : "thrinadh", "tr:custom2" : "Bheri" }
  required_tags = merge(local.project_tags, local.custom_tags)
}