variable "name_prefix" {
  type        = string
  default     = "terraform-lc-example-"
  description = "Launch config prefix"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Instance Type"
}

variable "on_demand_base_capacity" {
  type        = number
  default     = 0
  description = "On Demand Base capacity"
}

variable "on_demand_percentage_above_base_capacity" {
  type        = number
  default     = 25
  description = "On Demand Percentage Abive Base capacity"
}

variable "device_name" {
  type        = string
  default     = "/dev/xvdz"
  description = "ebs block device - device name"
}

variable "name" {
  type        = string
  default     = "terraform-dev-asg"
  description = "Name of ASG"
}

variable "min_size" {
  type        = number
  default     = 1
  description = "ASG - minimum size "
}

variable "max_size" {
  type        = number
  default     = 2
  description = "ASG - max size"
}

variable "health_check_type" {
  type        = string
  default     = "EC2"
  description = "ASG - health check typedescription"
}

variable "desired_capacity" {
  type        = number
  default     = 1
  description = "ASG - desired capacity"
}


