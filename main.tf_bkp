provider "aws" {
  region  = "us-west-2"
  profile = "Kaustubh"
}

provider "aws" {
  alias   = "useast1"
  region  = "us-east-1"
  profile = "Kaustubh"
}

provider "aws" {
  alias   = "apac"
  region  = "ap-southeast-1"
  profile = "Kaustubh"
}

locals {
  rds_clusters = [
    for i in range(1, 5) : {
      name   = "west-${format("%02d", i)}"
      reader = "west-${format("%02d", i)}-reader-db"
      writer = "west-${format("%02d", i)}-writer-db"
    }
  ]

  rds_clusters_east = [
    for i in range(1, 5) : {
      name   = "east-${format("%02d", i)}"
      reader = "east-${format("%02d", i)}-reader-db"
      writer = "east-${format("%02d", i)}-writer-db"
    }
  ]

  rds_clusters_apac = [
    for i in range(1, 26) : {
      name   = "apac-${format("%02d", i)}"
      reader = "kp-apac-instance-${format("%02d", i)}-Reader"
      writer = "kp-apac-instance-${format("%02d", i)}-Writer"
    }
  ]
}

# RDS ALARMS - WEST REGION
module "rds_alarms" {
  source = "./modules/rds_alarm"

  for_each = {
    for item in local.rds_clusters : "${item.name}_READER" => {
      db_id          = item.reader
      alarm_prefix   = "New-${item.name}-RDS-READER"
      cpu_threshold  = var.alarm_config.cpu_threshold_reader
      conn_threshold = var.alarm_config.connection_threshold_reader
    }
  }

  alarm_prefix           = each.value.alarm_prefix
  db_instance_identifier = each.value.db_id
  cpu_threshold          = each.value.cpu_threshold
  connection_threshold   = each.value.conn_threshold
  period                 = var.alarm_config.period
  evaluation_periods     = var.alarm_config.evaluation_periods
  datapoints_to_alarm    = var.alarm_config.datapoints_to_alarm
  statistic              = var.alarm_config.statistic
}

module "rds_writer_alarms" {
  source = "./modules/rds_alarm"

  for_each = {
    for item in local.rds_clusters : "${item.name}_WRITER" => {
      db_id          = item.writer
      alarm_prefix   = "New-${item.name}-RDS-WRITER"
      cpu_threshold  = var.alarm_config.cpu_threshold_writer
      conn_threshold = var.alarm_config.connection_threshold_writer
    }
  }

  alarm_prefix           = each.value.alarm_prefix
  db_instance_identifier = each.value.db_id
  cpu_threshold          = each.value.cpu_threshold
  connection_threshold   = each.value.conn_threshold
  period                 = var.alarm_config.period
  evaluation_periods     = var.alarm_config.evaluation_periods
  datapoints_to_alarm    = var.alarm_config.datapoints_to_alarm
  statistic              = var.alarm_config.statistic
}

# RDS ALARMS - EAST REGION
module "rds_alarms_east" {
  source = "./modules/rds_alarm"

  providers = {
    aws = aws.useast1
  }

  for_each = {
    for item in local.rds_clusters_east : "${item.name}_READER" => {
      db_id          = item.reader
      alarm_prefix   = "New-${item.name}-RDS-READER"
      cpu_threshold  = var.alarm_config.cpu_threshold_reader
      conn_threshold = var.alarm_config.connection_threshold_reader
    }
  }

  alarm_prefix           = each.value.alarm_prefix
  db_instance_identifier = each.value.db_id
  cpu_threshold          = each.value.cpu_threshold
  connection_threshold   = each.value.conn_threshold
  period                 = var.alarm_config.period
  evaluation_periods     = var.alarm_config.evaluation_periods
  datapoints_to_alarm    = var.alarm_config.datapoints_to_alarm
  statistic              = var.alarm_config.statistic
}

module "rds_writer_alarms_east" {
  source = "./modules/rds_alarm"

  providers = {
    aws = aws.useast1
  }

  for_each = {
    for item in local.rds_clusters_east : "${item.name}_WRITER" => {
      db_id          = item.writer
      alarm_prefix   = "New-${item.name}-RDS-WRITER"
      cpu_threshold  = var.alarm_config.cpu_threshold_writer
      conn_threshold = var.alarm_config.connection_threshold_writer
    }
  }

  alarm_prefix           = each.value.alarm_prefix
  db_instance_identifier = each.value.db_id
  cpu_threshold          = each.value.cpu_threshold
  connection_threshold   = each.value.conn_threshold
  period                 = var.alarm_config.period
  evaluation_periods     = var.alarm_config.evaluation_periods
  datapoints_to_alarm    = var.alarm_config.datapoints_to_alarm
  statistic              = var.alarm_config.statistic
}

# RDS ALARMS - APAC REGION
module "rds_alarms_apac" {
  source = "./modules/rds_alarm"

  providers = {
    aws = aws.apac
  }

  for_each = {
    for item in local.rds_clusters_apac : "${item.name}_READER" => {
      db_id          = item.reader
      alarm_prefix   = "New-${item.name}-RDS-READER"
      cpu_threshold  = var.alarm_config.cpu_threshold_reader
      conn_threshold = var.alarm_config.connection_threshold_reader
    }
  }

  alarm_prefix           = each.value.alarm_prefix
  db_instance_identifier = each.value.db_id
  cpu_threshold          = each.value.cpu_threshold
  connection_threshold   = each.value.conn_threshold
  period                 = var.alarm_config.period
  evaluation_periods     = var.alarm_config.evaluation_periods
  datapoints_to_alarm    = var.alarm_config.datapoints_to_alarm
  statistic              = var.alarm_config.statistic
}

module "rds_writer_alarms_apac" {
  source = "./modules/rds_alarm"

  providers = {
    aws = aws.apac
  }

  for_each = {
    for item in local.rds_clusters_apac : "${item.name}_WRITER" => {
      db_id          = item.writer
      alarm_prefix   = "New-${item.name}-RDS-WRITER"
      cpu_threshold  = var.alarm_config.cpu_threshold_writer
      conn_threshold = var.alarm_config.connection_threshold_writer
    }
  }

  alarm_prefix           = each.value.alarm_prefix
  db_instance_identifier = each.value.db_id
  cpu_threshold          = each.value.cpu_threshold
  connection_threshold   = each.value.conn_threshold
  period                 = var.alarm_config.period
  evaluation_periods     = var.alarm_config.evaluation_periods
  datapoints_to_alarm    = var.alarm_config.datapoints_to_alarm
  statistic              = var.alarm_config.statistic
}

# SQS QUEUE ALARMS - WEST
module "sqs_alarms" {
  source = "./modules/sqs_alarms"

  for_each = {
    for queue in var.sqs_queues : queue.name => queue
  }

  queue_name                   = each.value.name
  visible_threshold            = each.value.visible_threshold
  oldest_message_age_threshold = each.value.oldest_message_age_threshold
}

# SQS QUEUE ALARMS - EAST
module "sqs_alarms_east" {
  source = "./modules/sqs_alarms"

  providers = {
    aws = aws.useast1
  }

  for_each = {
    for queue in var.sqs_queues_east : queue.name => queue
  }

  queue_name                   = each.value.name
  visible_threshold            = each.value.visible_threshold
  oldest_message_age_threshold = each.value.oldest_message_age_threshold
}
