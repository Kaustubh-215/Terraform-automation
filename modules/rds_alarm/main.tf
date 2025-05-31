terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # or your preferred version
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "${var.alarm_prefix}-CPU"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = 120
  statistic           = "Average"
  threshold           = var.cpu_threshold
  alarm_description   = "Alarm when CPU > ${var.cpu_threshold}%"
  dimensions = {
    DBInstanceIdentifier = var.db_instance_identifier
  }
  actions_enabled = false
}

resource "aws_cloudwatch_metric_alarm" "connection_alarm" {
  alarm_name          = "${var.alarm_prefix}-CONNECTIONS"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "DatabaseConnections"
  namespace           = "AWS/RDS"
  period              = 120
  statistic           = "Average"
  threshold           = var.connection_threshold
  alarm_description   = "Alarm when DB connections > ${var.connection_threshold}"
  dimensions = {
    DBInstanceIdentifier = var.db_instance_identifier
  }
  actions_enabled = false
}

