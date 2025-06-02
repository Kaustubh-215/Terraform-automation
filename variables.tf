variable "rds_clusters" {
  description = "List of RDS cluster mappings"
  type = list(object({
    name   = string
    reader = string
    writer = string
  }))
}

variable "sqs_queues" {
  type = list(object({
    name                         = string
    visible_threshold            = number
    oldest_message_age_threshold = number
  }))
}

variable "rds_clusters_east" {
  description = "List of RDS cluster mappings for us-east-1"
  type = list(object({
    name   = string
    reader = string
    writer = string
  }))
}

variable "sqs_queues_east" {
  description = "List of SQS queues to monitor in us-east-1"
  type = list(object({
    name                         = string
    visible_threshold            = number
    oldest_message_age_threshold = number
  }))
}
