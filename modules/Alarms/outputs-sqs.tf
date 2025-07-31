# SQS outputs
output "visible_messages_alarm_name" {
  value       = var.type == "sqs" ? aws_cloudwatch_metric_alarm.sqs_visible_messages_alarm[0].alarm_name : null
  description = "Name of the SQS visible message count alarm"
}

output "oldest_message_alarm_name" {
  value       = var.type == "sqs" ? aws_cloudwatch_metric_alarm.sqs_oldest_message_alarm[0].alarm_name : null
  description = "Name of the SQS oldest message alarm"
}
