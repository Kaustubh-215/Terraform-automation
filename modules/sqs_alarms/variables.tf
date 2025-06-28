variable "queue_name" {
  description = "The name of the SQS queue"
  type        = string
}

variable "visible_threshold" {
  description = "Threshold for ApproximateNumberOfMessagesVisible"
  type        = number
}

variable "oldest_message_age_threshold" {
  description = "Threshold (in seconds) for ApproximateAgeOfOldestMessage"
  type        = number
}
