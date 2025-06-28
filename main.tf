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
  cpu_threshold_reader        = 70
  cpu_threshold_writer        = 80
  connection_threshold_reader = 1800
  connection_threshold_writer = 2100

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

# WEST REGION MODULES (default provider)
module "rds_alarms" {
  for_each = {
    for item in local.rds_clusters : "${item.name}_READER" => {
      db_id          = item.reader
      alarm_prefix   = "New-${item.name}-RDS-READER"
      cpu_threshold  = local.cpu_threshold_reader
      conn_threshold = local.connection_threshold_reader
    }
  }

  source                 = "./modules/rds_alarm"
  alarm_prefix           = each.value.alarm_prefix
  db_instance_identifier = each.value.db_id
  cpu_threshold          = each.value.cpu_threshold
  connection_threshold   = each.value.conn_threshold
}

module "rds_writer_alarms" {
  for_each = {
    for item in local.rds_clusters : "${item.name}_WRITER" => {
      db_id          = item.writer
      alarm_prefix   = "New-${item.name}-RDS-WRITER"
      cpu_threshold  = local.cpu_threshold_writer
      conn_threshold = local.connection_threshold_writer
    }
  }

  source                 = "./modules/rds_alarm"
  alarm_prefix           = each.value.alarm_prefix
  db_instance_identifier = each.value.db_id
  cpu_threshold          = each.value.cpu_threshold
  connection_threshold   = each.value.conn_threshold
}

# EAST REGION MODULES
module "rds_alarms_east" {
  for_each = {
    for item in local.rds_clusters_east : "${item.name}_READER" => {
      db_id          = item.reader
      alarm_prefix   = "New-${item.name}-RDS-READER"
      cpu_threshold  = local.cpu_threshold_reader
      conn_threshold = local.connection_threshold_reader
    }
  }

  source = "./modules/rds_alarm"

  providers = {
    aws = aws.useast1
  }

  alarm_prefix           = each.value.alarm_prefix
  db_instance_identifier = each.value.db_id
  cpu_threshold          = each.value.cpu_threshold
  connection_threshold   = each.value.conn_threshold
}

module "rds_writer_alarms_east" {
  for_each = {
    for item in local.rds_clusters_east : "${item.name}_WRITER" => {
      db_id          = item.writer
      alarm_prefix   = "New-${item.name}-RDS-WRITER"
      cpu_threshold  = local.cpu_threshold_writer
      conn_threshold = local.connection_threshold_writer
    }
  }

  source = "./modules/rds_alarm"

  providers = {
    aws = aws.useast1
  }

  alarm_prefix           = each.value.alarm_prefix
  db_instance_identifier = each.value.db_id
  cpu_threshold          = each.value.cpu_threshold
  connection_threshold   = each.value.conn_threshold
}

# APAC REGION MODULES
module "rds_alarms_apac" {
  for_each = {
    for item in local.rds_clusters_apac : "${item.name}_READER" => {
      db_id          = item.reader
      alarm_prefix   = "New-${item.name}-RDS-READER"
      cpu_threshold  = local.cpu_threshold_reader
      conn_threshold = local.connection_threshold_reader
    }
  }

  source = "./modules/rds_alarm"

  providers = {
    aws = aws.apac
  }

  alarm_prefix           = each.value.alarm_prefix
  db_instance_identifier = each.value.db_id
  cpu_threshold          = each.value.cpu_threshold
  connection_threshold   = each.value.conn_threshold
}

module "rds_writer_alarms_apac" {
  for_each = {
    for item in local.rds_clusters_apac : "${item.name}_WRITER" => {
      db_id          = item.writer
      alarm_prefix   = "New-${item.name}-RDS-WRITER"
      cpu_threshold  = local.cpu_threshold_writer
      conn_threshold = local.connection_threshold_writer
    }
  }

  source = "./modules/rds_alarm"

  providers = {
    aws = aws.apac
  }

  alarm_prefix           = each.value.alarm_prefix
  db_instance_identifier = each.value.db_id
  cpu_threshold          = each.value.cpu_threshold
  connection_threshold   = each.value.conn_threshold
}

# SQS QUEUE ALARMS (West Region - default provider)
module "sqs_alarms" {
  source = "./modules/sqs_alarms"

  for_each = {
    for queue in var.sqs_queues : queue.name => queue
  }

  queue_name                    = each.value.name
  visible_threshold             = each.value.visible_threshold
  oldest_message_age_threshold = each.value.oldest_message_age_threshold
}

# SQS QUEUE ALARMS (East Region - useast1 provider)
module "sqs_alarms_east" {
  source = "./modules/sqs_alarms"

  providers = {
    aws = aws.useast1
  }

  for_each = {
    for queue in var.sqs_queues_east : queue.name => queue
  }

  queue_name                    = each.value.name
  visible_threshold             = each.value.visible_threshold
  oldest_message_age_threshold = each.value.oldest_message_age_threshold
}
