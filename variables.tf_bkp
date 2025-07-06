variable "alarm_config" {
  description = "Global CloudWatch alarm configuration shared across all environments"
  type = object({
    cpu_threshold_reader        = number
    cpu_threshold_writer        = number
    connection_threshold_reader = number
    connection_threshold_writer = number
    period                      = number
    evaluation_periods          = number
    datapoints_to_alarm         = number
    statistic                   = string
  })
}

variable "sqs_queues" {
  description = "SQS queues in the default (west) region"
  type = list(object({
    name                         = string
    visible_threshold            = number
    oldest_message_age_threshold = number
  }))
}

variable "sqs_queues_east" {
  description = "SQS queues in the east region"
  type = list(object({
    name                         = string
    visible_threshold            = number
    oldest_message_age_threshold = number
  }))
}
