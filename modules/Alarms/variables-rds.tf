variable "type" {
  description = "Type of alarm to create: 'rds' or 'sqs'"
  type        = string
}

# RDS-specific variables
variable "rds_alarm_prefix" {
  type    = string
  default = null
}

variable "rds_db_instance_identifier" {
  type    = string
  default = null
}

variable "rds_cpu_threshold" {
  type    = number
  default = null
}

variable "rds_connection_threshold" {
  type    = number
  default = null
}

variable "rds_period" {
  type    = number
  default = null
}

variable "rds_evaluation_periods" {
  type    = number
  default = null
}

variable "rds_datapoints_to_alarm" {
  type    = number
  default = null
}

variable "rds_statistic" {
  type    = string
  default = null
}
