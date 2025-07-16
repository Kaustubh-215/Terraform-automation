provider "aws" {
  region  = var.region
  profile = var.aws_profile
}

locals {
  rds_clusters = [
    for i in range(1, 4) : {
      name   = "rds-${format("%02d", i)}"
      reader = "rds-${format("%02d", i)}-reader"
      writer = "rds-${format("%02d", i)}-writer"
    }
  ]
}

# ---------------------
# RDS Reader Alarms
# ---------------------
module "rds_reader_alarms" {
  source = "./modules/rds_alarms"

  for_each = {
    for cluster in local.rds_clusters : "${cluster.name}_reader" => {
      db_id        = cluster.reader
      alarm_prefix = "${var.env_name}-${cluster.name}-RDS-READER"
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

# ---------------------
# RDS Writer Alarms
# ---------------------
module "rds_writer_alarms" {
  source = "./modules/rds_alarms"

  for_each = {
    for cluster in local.rds_clusters : "${cluster.name}_writer" => {
      db_id        = cluster.writer
      alarm_prefix = "${var.env_name}-${cluster.name}-RDS-WRITER"
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

# ---------------------
# SQS Queue Alarms
# ---------------------
module "sqs_alarms" {
  source = "./modules/sqs_alarms"

  for_each = {
    for queue in var.sqs_queues : queue.name => queue
  }

  queue_name                   = each.value.name
  visible_threshold            = each.value.visible_threshold
  oldest_message_age_threshold = each.value.oldest_message_age_threshold
  alarm_prefix                 = "${var.env_name}-${each.value.name}-SQS"
}
