variable "alarm_prefix" {
  description = "Prefix used for naming the alarm"
  type        = string
}

variable "db_instance_identifier" {
  description = "RDS DB instance name"
  type        = string
}

variable "cpu_threshold" {
  description = "CPU utilization threshold"
  type        = number
}

variable "connection_threshold" {
  description = "Database connection count threshold"
  type        = number
}

variable "period" {
  description = "Monitoring period in seconds"
  type        = number
}

variable "evaluation_periods" {
  description = "Number of periods for evaluation"
  type        = number
}

variable "datapoints_to_alarm" {
  description = "Datapoints required to trigger alarm"
  type        = number
}

variable "statistic" {
  description = "CloudWatch metric statistic"
  type        = string
}
