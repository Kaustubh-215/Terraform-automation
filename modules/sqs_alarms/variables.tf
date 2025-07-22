variable "alarm_prefix" {
  description = "Alarm name prefix (e.g., dev-us-east-1-queue-name-SQS)"
  type        = string
}

variable "queue_name" {
  description = "Name of the SQS queue"
  type        = string
}

variable "visible_threshold" {
  description = "Threshold for visible messages alarm"
  type        = number
}

variable "oldest_message_age_threshold" {
  description = "Threshold for oldest message age alarm"
  type        = number
}
