provider "aws" {
  region  = "us-west-2"
  profile = "Kaustubh" # Add your profile for this region
}

provider "aws" {
  alias   = "useast1"
  region  = "us-east-1"
  profile = "Kaustubh" # Use the same profile or another if different
}

provider "aws" {
  alias   = "apac"
  region  = "ap-southeast-1"
  profile = "Kaustubh" # Ensure this profile exists in your AWS credentials
}

locals {
  cpu_threshold_reader        = 70
  cpu_threshold_writer        = 80
  connection_threshold_reader = 1800
  connection_threshold_writer = 2100
}

module "rds_alarms" {
  for_each = {
    for item in var.rds_clusters : "${item.name}_READER" => {
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
    for item in var.rds_clusters : "${item.name}_WRITER" => {
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

module "rds_alarms_east" {
  for_each = {
    for item in var.rds_clusters_east : "${item.name}_READER" => {
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
    for item in var.rds_clusters_east : "${item.name}_WRITER" => {
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

module "rds_alarms_apac" {
  for_each = {
    for item in var.rds_clusters_apac : "${item.name}_READER" => {
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
    for item in var.rds_clusters_apac : "${item.name}_WRITER" => {
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

module "sqs_alarms" {
  source = "./modules/sqs_alarms"

  for_each = {
    for queue in var.sqs_queues : queue.name => queue
  }

  queue_name                   = each.value.name
  visible_threshold            = each.value.visible_threshold
  oldest_message_age_threshold = each.value.oldest_message_age_threshold
}

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

module "sqs_alarms_apac" {
  source = "./modules/sqs_alarms"

  providers = {
    aws = aws.apac
  }

  for_each = {
    for queue in var.sqs_queues_apac : queue.name => queue
  }

  queue_name                   = each.value.name
  visible_threshold            = each.value.visible_threshold
  oldest_message_age_threshold = each.value.oldest_message_age_threshold
}
