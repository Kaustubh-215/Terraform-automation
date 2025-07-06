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
  # Region-specific alarm configuration
  west_config = var.alarm_config_by_region["us-west-2"]
  east_config = var.alarm_config_by_region["us-east-1"]
  apac_config = var.alarm_config_by_region["ap-southeast-1"]

  # RDS clusters by region
  rds_clusters = [
    for i in range(1, 25) : {
      name   = "west-${format("%02d", i)}"
      reader = "west-${format("%02d", i)}-reader-db"
      writer = "west-${format("%02d", i)}-writer-db"
    }
  ]

  rds_clusters_east = [
    for i in range(1, 25) : {
      name   = "east-${format("%02d", i)}"
      reader = "east-${format("%02d", i)}-reader-db"
      writer = "east-${format("%02d", i)}-writer-db"
    }
  ]

  rds_clusters_apac = [
    for i in range(1, 25) : {
      name   = "apac-${format("%02d", i)}"
      reader = "kp-apac-instance-${format("%02d", i)}-Reader"
      writer = "kp-apac-instance-${format("%02d", i)}-Writer"
    }
  ]
}

######################################
# RDS ALARMS - WEST REGION
######################################

module "rds_alarms_west" {
  source = "./modules/rds_alarm"

  for_each = {
    for item in local.rds_clusters : "${item.name}_READER" => {
      db_id        = item.reader
      alarm_prefix = "New-${item.name}-RDS-READER"
    }
  }

  alarm_prefix           = each.value.alarm_prefix
  db_instance_identifier = each.value.db_id
  cpu_threshold          = local.west_config.cpu_threshold_reader
  connection_threshold   = local.west_config.connection_threshold_reader
  period                 = local.west_config.period
  evaluation_periods     = local.west_config.evaluation_periods
  datapoints_to_alarm    = local.west_config.datapoints_to_alarm
  statistic              = local.west_config.statistic
}

module "rds_writer_alarms_west" {
  source = "./modules/rds_alarm"

  for_each = {
    for item in local.rds_clusters : "${item.name}_WRITER" => {
      db_id        = item.writer
      alarm_prefix = "New-${item.name}-RDS-WRITER"
    }
  }

  alarm_prefix           = each.value.alarm_prefix
  db_instance_identifier = each.value.db_id
  cpu_threshold          = local.west_config.cpu_threshold_writer
  connection_threshold   = local.west_config.connection_threshold_writer
  period                 = local.west_config.period
  evaluation_periods     = local.west_config.evaluation_periods
  datapoints_to_alarm    = local.west_config.datapoints_to_alarm
  statistic              = local.west_config.statistic
}

######################################
# RDS ALARMS - EAST REGION
######################################

module "rds_alarms_east" {
  source    = "./modules/rds_alarm"
  providers = { aws = aws.useast1 }

  for_each = {
    for item in local.rds_clusters_east : "${item.name}_READER" => {
      db_id        = item.reader
      alarm_prefix = "New-${item.name}-RDS-READER"
    }
  }

  alarm_prefix           = each.value.alarm_prefix
  db_instance_identifier = each.value.db_id
  cpu_threshold          = local.east_config.cpu_threshold_reader
  connection_threshold   = local.east_config.connection_threshold_reader
  period                 = local.east_config.period
  evaluation_periods     = local.east_config.evaluation_periods
  datapoints_to_alarm    = local.east_config.datapoints_to_alarm
  statistic              = local.east_config.statistic
}

module "rds_writer_alarms_east" {
  source    = "./modules/rds_alarm"
  providers = { aws = aws.useast1 }

  for_each = {
    for item in local.rds_clusters_east : "${item.name}_WRITER" => {
      db_id        = item.writer
      alarm_prefix = "New-${item.name}-RDS-WRITER"
    }
  }

  alarm_prefix           = each.value.alarm_prefix
  db_instance_identifier = each.value.db_id
  cpu_threshold          = local.east_config.cpu_threshold_writer
  connection_threshold   = local.east_config.connection_threshold_writer
  period                 = local.east_config.period
  evaluation_periods     = local.east_config.evaluation_periods
  datapoints_to_alarm    = local.east_config.datapoints_to_alarm
  statistic              = local.east_config.statistic
}

######################################
# RDS ALARMS - APAC REGION
######################################

module "rds_alarms_apac" {
  source    = "./modules/rds_alarm"
  providers = { aws = aws.apac }

  for_each = {
    for item in local.rds_clusters_apac : "${item.name}_READER" => {
      db_id        = item.reader
      alarm_prefix = "New-${item.name}-RDS-READER"
    }
  }

  alarm_prefix           = each.value.alarm_prefix
  db_instance_identifier = each.value.db_id
  cpu_threshold          = local.apac_config.cpu_threshold_reader
  connection_threshold   = local.apac_config.connection_threshold_reader
  period                 = local.apac_config.period
  evaluation_periods     = local.apac_config.evaluation_periods
  datapoints_to_alarm    = local.apac_config.datapoints_to_alarm
  statistic              = local.apac_config.statistic
}

module "rds_writer_alarms_apac" {
  source    = "./modules/rds_alarm"
  providers = { aws = aws.apac }

  for_each = {
    for item in local.rds_clusters_apac : "${item.name}_WRITER" => {
      db_id        = item.writer
      alarm_prefix = "New-${item.name}-RDS-WRITER"
    }
  }

  alarm_prefix           = each.value.alarm_prefix
  db_instance_identifier = each.value.db_id
  cpu_threshold          = local.apac_config.cpu_threshold_writer
  connection_threshold   = local.apac_config.connection_threshold_writer
  period                 = local.apac_config.period
  evaluation_periods     = local.apac_config.evaluation_periods
  datapoints_to_alarm    = local.apac_config.datapoints_to_alarm
  statistic              = local.apac_config.statistic
}

######################################
# SQS QUEUE ALARMS - WEST REGION
######################################

module "sqs_alarms_west" {
  source = "./modules/sqs_alarms"

  for_each = {
    for queue in var.sqs_queues_west : queue.name => queue
  }

  queue_name                   = each.value.name
  visible_threshold            = each.value.visible_threshold
  oldest_message_age_threshold = each.value.oldest_message_age_threshold
}

######################################
# SQS QUEUE ALARMS - EAST REGION
######################################

module "sqs_alarms_east" {
  source    = "./modules/sqs_alarms"
  providers = { aws = aws.useast1 }

  for_each = {
    for queue in var.sqs_queues_east : queue.name => queue
  }

  queue_name                   = each.value.name
  visible_threshold            = each.value.visible_threshold
  oldest_message_age_threshold = each.value.oldest_message_age_threshold
}





######################################
# SQS QUEUE ALARMS - APAC REGION
######################################

module "sqs_alarms_apac" {
  source    = "./modules/sqs_alarms"
  providers = { aws = aws.apac }

  for_each = {
    for queue in var.sqs_queues_apac : queue.name => queue
  }

  queue_name                   = each.value.name
  visible_threshold            = each.value.visible_threshold
  oldest_message_age_threshold = each.value.oldest_message_age_threshold
}
