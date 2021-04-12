resource "aws_cloudwatch_metric_alarm" "service_cpu_high" {
  alarm_name          = "${var.project}-${var.environment}-cpu_utilization_high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = "85"
  unit                = "Percent"


  dimensions = {
    ClusterName = aws_ecs_cluster.ecs_cluster.name
    ServiceName = aws_ecs_service.ecs_service_backend.name
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [module.ecs_cloudwatch_autoscaling.scale_up_policy_arn]
}


resource "aws_cloudwatch_metric_alarm" "service_cpu_low" {
  alarm_name          = "${var.project}-${var.environment}-cpu_utilization_low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = "10"
  unit                = "Percent"


  dimensions = {
    ClusterName = aws_ecs_cluster.ecs_cluster.name
    ServiceName = aws_ecs_service.ecs_service_backend.name
  }

  alarm_description = "This metric monitors ecs cpu utilization"
  alarm_actions     = [module.ecs_cloudwatch_autoscaling.scale_down_policy_arn]
}