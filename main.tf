provider "aws" {
  region  = var.region
  profile = var.aws_profile
}

# ---------------------------------------------------
# Define RDS Readers, Writers and SQS Queue Names
# ---------------------------------------------------
locals {
  rds_readers = [
    "instance-01",
    "instance-02",
    "instance-03",
    "instance-04",
    "instance-05",
    "instance-06",
    "instance-07",
    "instance-08",
    "instance-09"
  ]

  rds_writers = [
    "instance-01",
    "instance-02",
    "instance-03",
    "instance-04",
    "instance-05",
    "instance-06",
    "instance-07",
    "instance-08",
    "instance-09"
  ]

  sqs_queue_names = [
    "sqs-night-audit",
    "sqs-pre-night-audit",
    "sqs-push-down-to-slave",
    "queue-1",
    "queue-2",
    "queue-3"
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
      alarm_prefix = "${var.env_name}-${var.region}-${name}-RDS-READER"
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
      alarm_prefix = "${var.env_name}-${var.region}-${name}-RDS-WRITER"
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
    for queue_name, config in var.sqs_thresholds : queue_name => {
      alarm_prefix                 = "${var.env_name}-${var.region}-${queue_name}"
      visible_threshold            = config.visible
      oldest_message_age_threshold = config.oldest_age
    }
  }

  alarm_prefix                 = each.value.alarm_prefix
  queue_name                   = each.key
  visible_threshold            = each.value.visible_threshold
  oldest_message_age_threshold = each.value.oldest_message_age_threshold
}
