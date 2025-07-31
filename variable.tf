variable "region" {
  description = "AWS region"
  type        = string
}

variable "aws_profile" {
  description = "AWS CLI profile to use"
  type        = string
}

variable "env_name" {
  description = "Environment name (e.g. dev, staging, prod)"
  type        = string
}

variable "cpu_threshold_reader" {
  description = "CPU threshold for reader alarms"
  type        = number
}

variable "connection_threshold_reader" {
  description = "Connection count threshold for reader alarms"
  type        = number
}

variable "cpu_threshold_writer" {
  description = "CPU threshold for writer alarms"
  type        = number
}

variable "connection_threshold_writer" {
  description = "Connection count threshold for writer alarms"
  type        = number
}

variable "period" {
  description = "Period for metric evaluation (in seconds)"
  type        = number
}

variable "evaluation_periods" {
  description = "Number of evaluation periods to compare metrics"
  type        = number
}

variable "datapoints_to_alarm" {
  description = "Datapoints required to trigger alarm"
  type        = number
}

variable "statistic" {
  description = "Metric statistic to evaluate (e.g. Average, Maximum)"
  type        = string
}

variable "sqs_thresholds" {
  description = "Map of SQS queue thresholds"
  type = map(object({
    visible    = number
    oldest_age = number
  }))
  default = {
    "sqs-night-audit" = {
      visible    = 100
      oldest_age = 300
    }
    "sqs-pre-night-audit" = {
      visible    = 120
      oldest_age = 250
    }
    "sqs-push-down-to-slave" = {
      visible    = 150
      oldest_age = 400
    }
    "queue-1" = {
      visible    = 200
      oldest_age = 360
    }
    "queue-2" = {
      visible    = 180
      oldest_age = 320
    }
    "queue-3" = {
      visible    = 170
      oldest_age = 310
    }
  }
}

