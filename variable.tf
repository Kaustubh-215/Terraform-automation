variable "aws_profile" {
  description = "AWS profile used for authentication"
  type        = string
}

variable "env_name" {
  description = "Environment label for naming resources"
  type        = string
}

variable "region" {
  description = "AWS region for deployment"
  type        = string
}

# RDS alarm thresholds
variable "cpu_threshold_reader" {
  type        = number
  description = "CPU threshold for RDS reader instances"
}

variable "cpu_threshold_writer" {
  type        = number
  description = "CPU threshold for RDS writer instances"
}

variable "connection_threshold_reader" {
  type        = number
  description = "Connection threshold for RDS readers"
}

variable "connection_threshold_writer" {
  type        = number
  description = "Connection threshold for RDS writers"
}

variable "period" {
  type        = number
  description = "Period for CloudWatch alarms"
}

variable "evaluation_periods" {
  type        = number
  description = "Evaluation periods"
}

variable "datapoints_to_alarm" {
  type        = number
  description = "Datapoints required to trigger an alarm"
}

variable "statistic" {
  type        = string
  description = "CloudWatch metric statistic"
}

# SQS queue inputs
variable "sqs_queues" {
  description = "List of SQS queues and thresholds"
  type = list(object({
    name                         = string
    visible_threshold            = number
    oldest_message_age_threshold = number
  }))
}
