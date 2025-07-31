# SQS Visible Messages Alarm
resource "aws_cloudwatch_metric_alarm" "sqs_visible_messages_alarm" {
  count               = var.type == "sqs" ? 1 : 0
  alarm_name          = "${var.alarm_prefix}-VisibleMessages"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "ApproximateNumberOfMessagesVisible"
  namespace           = "AWS/SQS"
  period              = 60
  statistic           = "Average"
  threshold           = var.visible_threshold

  dimensions = {
    QueueName = var.queue_name
  }
}

# SQS Oldest Message Alarm
resource "aws_cloudwatch_metric_alarm" "sqs_oldest_message_alarm" {
  count               = var.type == "sqs" ? 1 : 0
  alarm_name          = "${var.alarm_prefix}-OldestMessageAge"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "ApproximateAgeOfOldestMessage"
  namespace           = "AWS/SQS"
  period              = 60
  statistic           = "Maximum"
  threshold           = var.oldest_message_age_threshold

  dimensions = {
    QueueName = var.queue_name
  }
}
