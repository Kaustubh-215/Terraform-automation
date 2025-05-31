output "visible_messages_alarm_name" {
  value = aws_cloudwatch_metric_alarm.visible_messages_alarms.alarm_name
}

output "oldest_message_alarm_name" {
  value = aws_cloudwatch_metric_alarm.oldest_message_alarms.alarm_name
}


