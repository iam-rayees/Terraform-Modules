variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "security_groups" {
  type = list(string)
}

variable "instance_ids" {
  type        = list(string)
  description = "List of instance IDs to attach to the target group"
}

variable "certificate_arn" {
  description = "ARN of the ACM certificate"
  type        = string
}
