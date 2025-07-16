output "visible_messages_alarm_name" {
  description = "Alarm name for visible SQS messages"
  value       = aws_cloudwatch_metric_alarm.visible_messages_alarms.alarm_name
}

output "oldest_message_alarm_name" {
  description = "Alarm name for oldest SQS message age"
  value       = aws_cloudwatch_metric_alarm.oldest_message_alarms.alarm_name
}
