# RDS CPU Alarm
resource "aws_cloudwatch_metric_alarm" "rds_cpu_alarm" {
  count               = var.type == "rds" ? 1 : 0
  alarm_name          = "${var.rds_alarm_prefix}-CPU"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.rds_evaluation_periods
  datapoints_to_alarm = var.rds_datapoints_to_alarm
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = var.rds_period
  statistic           = var.rds_statistic
  threshold           = var.rds_cpu_threshold

  dimensions = {
    DBInstanceIdentifier = var.rds_db_instance_identifier
  }
}

# RDS Connection Alarm
resource "aws_cloudwatch_metric_alarm" "rds_connection_alarm" {
  count               = var.type == "rds" ? 1 : 0
  alarm_name          = "${var.rds_alarm_prefix}-Connections"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.rds_evaluation_periods
  datapoints_to_alarm = var.rds_datapoints_to_alarm
  metric_name         = "DatabaseConnections"
  namespace           = "AWS/RDS"
  period              = var.rds_period
  statistic           = var.rds_statistic
  threshold           = var.rds_connection_threshold

  dimensions = {
    DBInstanceIdentifier = var.rds_db_instance_identifier
  }
}

