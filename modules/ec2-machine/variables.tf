variable "name" {
  type        = string
  description = "The name for the host."
}

variable "instance_type" {
  type        = string
  description = "The instance type for the host."
}

variable "subnet_id" {
  type        = string
  description = "The subnet ID for the host."
}

variable "ami_id" {
  type        = string
  description = "AMI ID for the host."
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for the host."
}

variable "use_elastic_ip" {
  type        = bool
  default     = false
  description = "Whether to associate an Elastic IP with the host."
}
