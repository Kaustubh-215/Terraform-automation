# SQS-specific variables
variable "alarm_prefix" {
  type    = string
  default = null
}

variable "queue_name" {
  type    = string
  default = null
}

variable "visible_threshold" {
  type    = number
  default = null
}

variable "oldest_message_age_threshold" {
  type    = number
  default = null
}
