output "cpu_alarm_name" {
  description = "Name of the CPU alarm"
  value       = aws_cloudwatch_metric_alarm.cpu_alarm.alarm_name
}

output "connection_alarm_name" {
  description = "Name of the connection alarm"
  value       = aws_cloudwatch_metric_alarm.connection_alarm.alarm_name
}
