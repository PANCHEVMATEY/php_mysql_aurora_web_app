# Create a ASG
resource "aws_autoscaling_group" "aws-autoscaling-group" {
  name                = "aws-autoscaling-group"
  desired_capacity    = 2
  max_size            = 2
  min_size            = 2
  vpc_zone_identifier = [aws_subnet.web-server-sub-pub.id, aws_subnet.web-server-sub-pub-2.id]
  target_group_arns   = [aws_lb_target_group.alb-target.arn]
  launch_template {
    id      = aws_launch_template.aws-launch-template.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "Front-End"
  }
}

# Create Auto Scale Policy
resource "aws_autoscaling_policy" "aws-autoscaling-policy" {
  name                   = "Auto-scaling-policy"
  cooldown               = 60
  autoscaling_group_name = aws_autoscaling_group.aws-autoscaling-group.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 2
}

# Create a Launch Configuration
resource "aws_launch_template" "aws-launch-template" {
  name_prefix            = var.instance_data.name-prefix
  image_id               = var.instance_data.image-id
  instance_type          = var.instance_data.instance_type
  update_default_version = true
  iam_instance_profile {
    name = aws_iam_instance_profile.iam-instance-profile.name
  }
  tags = {
    key                 = "Name"
    value               = "Front-End"
    propagate_at_launch = true
  }

  vpc_security_group_ids = [aws_security_group.VPC-sg.id]

  user_data = filebase64("${path.module}/user_data.sh")
}