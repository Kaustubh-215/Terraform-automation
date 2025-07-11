variable "alarm_config_by_region" {
  description = "Region-specific CloudWatch alarm configuration for RDS clusters"
  type = map(object({
    cpu_threshold_reader        = number
    cpu_threshold_writer        = number
    connection_threshold_reader = number
    connection_threshold_writer = number
    period                      = number
    evaluation_periods          = number
    datapoints_to_alarm         = number
    statistic                   = string
  }))
}

variable "sqs_queues_west" {
  description = "SQS queues in the us-west-2 (default) region"
  type = list(object({
    name                         = string
    visible_threshold            = number
    oldest_message_age_threshold = number
  }))
}

variable "sqs_queues_east" {
  description = "SQS queues in the us-east-1 region"
  type = list(object({
    name                         = string
    visible_threshold            = number
    oldest_message_age_threshold = number
  }))
}

variable "sqs_queues_apac" {
  description = "SQS queues in the ap-southeast-1 region"
  type = list(object({
    name                         = string
    visible_threshold            = number
    oldest_message_age_threshold = number
  }))
  default = []
}
