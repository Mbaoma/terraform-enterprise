
##############################################################
# Data sources to get VPC, subnets and security group details
##############################################################
data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

data "aws_security_group" "default" {
  vpc_id = data.aws_vpc.default.id
  name   = "default"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

######
# Launch configuration and autoscaling group
######
resource "aws_launch_template" "my_lt"  {
  name_prefix                               = var.name_prefix
  image_id                                  = data.aws_ami.ubuntu.id
  instance_type                             = var.instance_type


  block_device_mappings {
      device_name           = var.device_name 
    
    ebs {
      volume_size = 20
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "my_asg" {
  name                      = var.name
  min_size                  = var.min_size
  max_size                  = var.max_size
  health_check_type         = var.health_check_type
  desired_capacity          = var.desired_capacity 
  vpc_zone_identifier       = data.aws_subnet_ids.all.ids

  lifecycle {
    create_before_destroy = true
  }

  mixed_instances_policy  {
    instances_distribution  {
        on_demand_base_capacity                   = var.on_demand_base_capacity 
        on_demand_percentage_above_base_capacity  = var.on_demand_percentage_above_base_capacity
      }

    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.my_lt.id
      }
    }
  }
}