# RDS outputs
output "cpu_alarm_name" {
  value       = var.type == "rds" ? aws_cloudwatch_metric_alarm.rds_cpu_alarm[0].alarm_name : null
  description = "Name of the RDS CPU alarm"
}

output "connection_alarm_name" {
  value       = var.type == "rds" ? aws_cloudwatch_metric_alarm.rds_connection_alarm[0].alarm_name : null
  description = "Name of the RDS Connection alarm"
}
