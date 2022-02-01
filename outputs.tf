# Launch configuration
output "this_launch_configuration_id" {
  description = "The ID of the launch configuration"
  value       = aws_launch_template.my_lt.id
}

# Autoscaling group
output "this_autoscaling_group_id" {
  description = "The autoscaling group id"
  value       = aws_autoscaling_group.my_asg.id
}