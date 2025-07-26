terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "visible_alarm" {
  alarm_name                = "${var.alarm_prefix}-Visible-Messages"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 2
  metric_name               = "ApproximateNumberOfMessagesVisible"
  namespace                 = "AWS/SQS"
  period                    = 300
  statistic                 = "Average"
  threshold                 = var.visible_threshold
  alarm_description         = "Visible messages exceed threshold on ${var.queue_name}"
  datapoints_to_alarm       = 2
  dimensions = {
    QueueName               = var.queue_name
  }
}

resource "aws_cloudwatch_metric_alarm" "age_alarm" {
  alarm_name                = "${var.alarm_prefix}-Oldest-Message-Age"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 2
  metric_name               = "ApproximateAgeOfOldestMessage"
  namespace                 = "AWS/SQS"
  period                    = 300
  statistic                 = "Average"
  threshold                 = var.oldest_message_age_threshold
  alarm_description         = "Oldest message age exceeds threshold on ${var.queue_name}"
  datapoints_to_alarm       = 2
  dimensions = {
    QueueName               = var.queue_name
  }
}
