variable "alarm_prefix" {
  type = string
}

variable "db_instance_identifier" {
  type = string
}

variable "cpu_threshold" {
  type = number
}

variable "connection_threshold" {
  type = number
}

variable "period" {
  type    = number
  default = 300
}

variable "evaluation_periods" {
  type    = number
  default = 2
}

variable "datapoints_to_alarm" {
  type    = number
  default = 2
}

variable "statistic" {
  type    = string
  default = "Average"
}
