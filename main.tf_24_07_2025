provider "aws" {
  region  = var.region
  profile = var.aws_profile
}

# ---------------------------------------------------
# Local resource names (no env/region duplication)
# ---------------------------------------------------
locals {
  rds_readers = [
    "DEV-US-EAST-1-instance-01",
    "DEV-US-EAST-1-instance-02",
    "DEV-US-EAST-1-instance-03",
    "DEV-US-EAST-1-instance-04",
    "DEV-US-EAST-1-instance-05"
  ]

  rds_writers = [
    "DEV-US-EAST-1-instance-06",
    "DEV-US-EAST-1-instance-07",
    "DEV-US-EAST-1-instance-08",
    "DEV-US-EAST-1-instance-09",
    "DEV-US-EAST-1-instance-10"
  ]

  sqs_queue_names = [
    "DEV-US-EAST-1-SQS-night-audit",
    "DEV-US-EAST-1-SQS-pre-night-audit"
  ]
}

# ---------------------------------------------------
# RDS Reader Alarms
# ---------------------------------------------------
module "rds_reader_alarms" {
  source = "./modules/rds_alarms"

  for_each = {
    for name in local.rds_readers : name => {
      db_id        = name
      alarm_prefix = "${name}-RDS-READER"
    }
  }

  alarm_prefix           = each.value.alarm_prefix
  db_instance_identifier = each.value.db_id
  cpu_threshold          = var.cpu_threshold_reader
  connection_threshold   = var.connection_threshold_reader
  period                 = var.period
  evaluation_periods     = var.evaluation_periods
  datapoints_to_alarm    = var.datapoints_to_alarm
  statistic              = var.statistic
}

# ---------------------------------------------------
# RDS Writer Alarms
# ---------------------------------------------------
module "rds_writer_alarms" {
  source = "./modules/rds_alarms"

  for_each = {
    for name in local.rds_writers : name => {
      db_id        = name
      alarm_prefix = "${name}-RDS-WRITER"
    }
  }

  alarm_prefix           = each.value.alarm_prefix
  db_instance_identifier = each.value.db_id
  cpu_threshold          = var.cpu_threshold_writer
  connection_threshold   = var.connection_threshold_writer
  period                 = var.period
  evaluation_periods     = var.evaluation_periods
  datapoints_to_alarm    = var.datapoints_to_alarm
  statistic              = var.statistic
}

# ---------------------------------------------------
# SQS Queue Alarms
# ---------------------------------------------------
module "sqs_alarms" {
  source = "./modules/sqs_alarms"

  for_each = {
    for name in local.sqs_queue_names : name => {
      alarm_prefix                  = "${name}-SQS"
      visible_threshold             = var.sqs_thresholds[name].visible
      oldest_message_age_threshold = var.sqs_thresholds[name].oldest_age
    }
  }

  alarm_prefix                 = each.value.alarm_prefix
  queue_name                   = each.key
  visible_threshold            = each.value.visible_threshold
  oldest_message_age_threshold = each.value.oldest_message_age_threshold
}
