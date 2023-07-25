variable "aws_region" {
  type = string
  validation {
    condition     = can(regex("[a-z][a-z]-[a-z]+-[1-9]", var.aws_region))
    error_message = "Invalid AWS Region name."
  }
}

variable "aws_account_id" {
  type = string
  validation {
    condition     = length(var.aws_account_id) == 12 && can(regex("^\\d{12}$", var.aws_account_id))
    error_message = "Invalid AWS account ID"
  }
}

variable "aws_vpc_cidr" {
  type = string
  validation {
    condition     = can(cidrhost(var.vpc_cidr, 32))
    error_message = "Invalid IPv4 CIDR"
  }
}

variable "aws_vpc_azs" {
  description = "list of subnet AZs"
  type        = list(string)

  validation {
    condition = alltrue([
      for v in var.vpc_azs : can(regex("[a-z][a-z]-[a-z]+-[1-9][a-c]", v))
    ])
    error_message = "Invalid VPC AZ name"
  }
}