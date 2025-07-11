terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "${var.alarm_prefix}-CPU"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = var.period
  statistic           = var.statistic
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
  evaluation_periods  = var.evaluation_periods
  metric_name         = "DatabaseConnections"
  namespace           = "AWS/RDS"
  period              = var.period
  statistic           = var.statistic
  threshold           = var.connection_threshold
  alarm_description   = "Alarm when DB connections > ${var.connection_threshold}"

  dimensions = {
    DBInstanceIdentifier = var.db_instance_identifier
  }

  actions_enabled = false
}
