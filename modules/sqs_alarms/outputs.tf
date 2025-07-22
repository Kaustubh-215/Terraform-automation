output "visible_messages_alarm_name" {
  value = aws_cloudwatch_metric_alarm.visible_alarm.alarm_name
}

output "oldest_message_alarm_name" {
  value = aws_cloudwatch_metric_alarm.age_alarm.alarm_name
}
