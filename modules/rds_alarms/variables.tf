variable "alarm_prefix" {
  description = "Alarm name prefix (e.g., dev-us-east-1-rds-01-RDS-READER)"
  type        = string
}

variable "db_instance_identifier" {
  description = "Identifier of the RDS DB instance"
  type        = string
}

variable "cpu_threshold" {
  type        = number
  description = "Threshold for CPU utilization alarm"
}

variable "connection_threshold" {
  type        = number
  description = "Threshold for DB connection count alarm"
}

variable "period" {
  type        = number
  description = "Period of metric collection in seconds"
}

variable "evaluation_periods" {
  type        = number
  description = "Number of evaluation periods for alarm comparison"
}

variable "datapoints_to_alarm" {
  type        = number
  description = "Datapoints required to trigger alarm"
}

variable "statistic" {
  type        = string
  description = "Statistic type for alarm (e.g., Average, Maximum)"
}
