terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # or your preferred version
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "visible_messages_alarms" {
  alarm_name          = "SQS-${var.queue_name}-Visible-Messages"
  namespace           = "AWS/SQS"
  metric_name         = "ApproximateNumberOfMessagesVisible"
  dimensions          = { QueueName = var.queue_name }
  statistic           = "Average"
  period              = 300
  evaluation_periods  = 2
  threshold           = var.visible_threshold
  comparison_operator = "GreaterThanThreshold"
  alarm_description   = "Triggers when visible messages > ${var.visible_threshold}"
  actions_enabled     = false
}

resource "aws_cloudwatch_metric_alarm" "oldest_message_alarms" {
  alarm_name          = "SQS-${var.queue_name}-Oldest-Message-Age"
  namespace           = "AWS/SQS"
  metric_name         = "ApproximateAgeOfOldestMessage"
  dimensions          = { QueueName = var.queue_name }
  statistic           = "Maximum"
  period              = 300
  evaluation_periods  = 2
  threshold           = var.oldest_message_age_threshold
  comparison_operator = "GreaterThanThreshold"
  alarm_description   = "Triggers when oldest message age > ${var.oldest_message_age_threshold}s"
  actions_enabled     = false
}
