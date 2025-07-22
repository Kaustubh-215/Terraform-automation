terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name                = "${var.alarm_prefix}-CPU-UTILIZATION"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = var.evaluation_periods
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/RDS"
  period                    = var.period
  statistic                 = var.statistic
  threshold                 = var.cpu_threshold
  alarm_description         = "High CPU usage on ${var.db_instance_identifier}"
  datapoints_to_alarm       = var.datapoints_to_alarm
  dimensions = {
    DBInstanceIdentifier    = var.db_instance_identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "connection_alarm" {
  alarm_name                = "${var.alarm_prefix}-CONNECTIONS"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = var.evaluation_periods
  metric_name               = "DatabaseConnections"
  namespace                 = "AWS/RDS"
  period                    = var.period
  statistic                 = var.statistic
  threshold                 = var.connection_threshold
  alarm_description         = "High DB connections on ${var.db_instance_identifier}"
  datapoints_to_alarm       = var.datapoints_to_alarm
  dimensions = {
    DBInstanceIdentifier    = var.db_instance_identifier
  }
}
