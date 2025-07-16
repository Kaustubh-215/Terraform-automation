variable "alarm_prefix" {
  description = "Prefix for naming alarms (usually includes env and queue name)"
  type        = string
}

variable "queue_name" {
  description = "Name of the SQS queue"
  type        = string
}

variable "visible_threshold" {
  description = "Threshold for visible messages count"
  type        = number
}

variable "oldest_message_age_threshold" {
  description = "Threshold for age of oldest message (in seconds)"
  type        = number
}
