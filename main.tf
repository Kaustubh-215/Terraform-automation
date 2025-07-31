provider "aws" {
  region  = var.region       # This expects var.region to be set
  profile = var.aws_profile  # Optional: set if using named AWS CLI profiles
}

<<<<<<< HEAD
#  RDS Reader Alarms
module "rds_instance_01_reader_alarm" {
  source                     = "./modules/Alarms"
  type                       = "rds"
  rds_alarm_prefix           = "${var.env_name}-${var.region}-instance-01-RDS-READER"
  rds_db_instance_identifier = "instance-01"
  rds_cpu_threshold          = var.cpu_threshold_reader
  rds_connection_threshold   = var.connection_threshold_reader
  rds_period                 = var.period
  rds_evaluation_periods     = var.evaluation_periods
  rds_datapoints_to_alarm    = var.datapoints_to_alarm
  rds_statistic              = var.statistic
=======
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
>>>>>>> 02f31f3458d87199700eed1df85dff998503cec7
}

module "rds_instance_02_reader_alarm" {
  source                     = "./modules/Alarms"
  type                       = "rds"
  rds_alarm_prefix           = "${var.env_name}-${var.region}-instance-02-RDS-READER"
  rds_db_instance_identifier = "instance-02"
  rds_cpu_threshold          = var.cpu_threshold_reader
  rds_connection_threshold   = var.connection_threshold_reader
  rds_period                 = var.period
  rds_evaluation_periods     = var.evaluation_periods
  rds_datapoints_to_alarm    = var.datapoints_to_alarm
  rds_statistic              = var.statistic
}

module "rds_instance_03_reader_alarm" {
  source                     = "./modules/Alarms"
  type                       = "rds"
  rds_alarm_prefix           = "${var.env_name}-${var.region}-instance-03-RDS-READER"
  rds_db_instance_identifier = "instance-03"
  rds_cpu_threshold          = var.cpu_threshold_reader
  rds_connection_threshold   = var.connection_threshold_reader
  rds_period                 = var.period
  rds_evaluation_periods     = var.evaluation_periods
  rds_datapoints_to_alarm    = var.datapoints_to_alarm
  rds_statistic              = var.statistic
}

module "rds_instance_04_reader_alarm" {
  source                     = "./modules/Alarms"
  type                       = "rds"
  rds_alarm_prefix           = "${var.env_name}-${var.region}-instance-04-RDS-READER"
  rds_db_instance_identifier = "instance-04"
  rds_cpu_threshold          = var.cpu_threshold_reader
  rds_connection_threshold   = var.connection_threshold_reader
  rds_period                 = var.period
  rds_evaluation_periods     = var.evaluation_periods
  rds_datapoints_to_alarm    = var.datapoints_to_alarm
  rds_statistic              = var.statistic
}

module "rds_instance_05_reader_alarm" {
  source                     = "./modules/Alarms"
  type                       = "rds"
  rds_alarm_prefix           = "${var.env_name}-${var.region}-instance-05-RDS-READER"
  rds_db_instance_identifier = "instance-05"
  rds_cpu_threshold          = var.cpu_threshold_reader
  rds_connection_threshold   = var.connection_threshold_reader
  rds_period                 = var.period
  rds_evaluation_periods     = var.evaluation_periods
  rds_datapoints_to_alarm    = var.datapoints_to_alarm
  rds_statistic              = var.statistic
}

module "rds_instance_06_reader_alarm" {
  source                     = "./modules/Alarms"
  type                       = "rds"
  rds_alarm_prefix           = "${var.env_name}-${var.region}-instance-06-RDS-READER"
  rds_db_instance_identifier = "instance-06"
  rds_cpu_threshold          = var.cpu_threshold_reader
  rds_connection_threshold   = var.connection_threshold_reader
  rds_period                 = var.period
  rds_evaluation_periods     = var.evaluation_periods
  rds_datapoints_to_alarm    = var.datapoints_to_alarm
  rds_statistic              = var.statistic
}

module "rds_instance_07_reader_alarm" {
  source                     = "./modules/Alarms"
  type                       = "rds"
  rds_alarm_prefix           = "${var.env_name}-${var.region}-instance-07-RDS-READER"
  rds_db_instance_identifier = "instance-07"
  rds_cpu_threshold          = var.cpu_threshold_reader
  rds_connection_threshold   = var.connection_threshold_reader
  rds_period                 = var.period
  rds_evaluation_periods     = var.evaluation_periods
  rds_datapoints_to_alarm    = var.datapoints_to_alarm
  rds_statistic              = var.statistic
}

module "rds_instance_08_reader_alarm" {
  source                     = "./modules/Alarms"
  type                       = "rds"
  rds_alarm_prefix           = "${var.env_name}-${var.region}-instance-08-RDS-READER"
  rds_db_instance_identifier = "instance-08"
  rds_cpu_threshold          = var.cpu_threshold_reader
  rds_connection_threshold   = var.connection_threshold_reader
  rds_period                 = var.period
  rds_evaluation_periods     = var.evaluation_periods
  rds_datapoints_to_alarm    = var.datapoints_to_alarm
  rds_statistic              = var.statistic
}

module "rds_instance_09_reader_alarm" {
  source                     = "./modules/Alarms"
  type                       = "rds"
  rds_alarm_prefix           = "${var.env_name}-${var.region}-instance-09-RDS-READER"
  rds_db_instance_identifier = "instance-09"
  rds_cpu_threshold          = var.cpu_threshold_reader
  rds_connection_threshold   = var.connection_threshold_reader
  rds_period                 = var.period
  rds_evaluation_periods     = var.evaluation_periods
  rds_datapoints_to_alarm    = var.datapoints_to_alarm
  rds_statistic              = var.statistic
}

module "rds_instance_10_reader_alarm" {
  source                     = "./modules/Alarms"
  type                       = "rds"
  rds_alarm_prefix           = "${var.env_name}-${var.region}-instance-10-RDS-READER"
  rds_db_instance_identifier = "instance-10"
  rds_cpu_threshold          = var.cpu_threshold_reader
  rds_connection_threshold   = var.connection_threshold_reader
  rds_period                 = var.period
  rds_evaluation_periods     = var.evaluation_periods
  rds_datapoints_to_alarm    = var.datapoints_to_alarm
  rds_statistic              = var.statistic
}

#  RDS Writer Alarms

module "rds_instance_01_writer_alarm" {
  source                     = "./modules/Alarms"
  type                       = "rds"
  rds_alarm_prefix           = "${var.env_name}-${var.region}-instance-01-RDS-WRITER"
  rds_db_instance_identifier = "instance-01"
  rds_cpu_threshold          = var.cpu_threshold_writer
  rds_connection_threshold   = var.connection_threshold_writer
  rds_period                 = var.period
  rds_evaluation_periods     = var.evaluation_periods
  rds_datapoints_to_alarm    = var.datapoints_to_alarm
  rds_statistic              = var.statistic
}

module "rds_instance_02_writer_alarm" {
  source                     = "./modules/Alarms"
  type                       = "rds"
  rds_alarm_prefix           = "${var.env_name}-${var.region}-instance-02-RDS-WRITER"
  rds_db_instance_identifier = "instance-02"
  rds_cpu_threshold          = var.cpu_threshold_writer
  rds_connection_threshold   = var.connection_threshold_writer
  rds_period                 = var.period
  rds_evaluation_periods     = var.evaluation_periods
  rds_datapoints_to_alarm    = var.datapoints_to_alarm
  rds_statistic              = var.statistic
}

module "rds_instance_03_writer_alarm" {
  source                     = "./modules/Alarms"
  type                       = "rds"
  rds_alarm_prefix           = "${var.env_name}-${var.region}-instance-03-RDS-WRITER"
  rds_db_instance_identifier = "instance-03"
  rds_cpu_threshold          = var.cpu_threshold_writer
  rds_connection_threshold   = var.connection_threshold_writer
  rds_period                 = var.period
  rds_evaluation_periods     = var.evaluation_periods
  rds_datapoints_to_alarm    = var.datapoints_to_alarm
  rds_statistic              = var.statistic
}

module "rds_instance_04_writer_alarm" {
  source                     = "./modules/Alarms"
  type                       = "rds"
  rds_alarm_prefix           = "${var.env_name}-${var.region}-instance-04-RDS-WRITER"
  rds_db_instance_identifier = "instance-04"
  rds_cpu_threshold          = var.cpu_threshold_writer
  rds_connection_threshold   = var.connection_threshold_writer
  rds_period                 = var.period
  rds_evaluation_periods     = var.evaluation_periods
  rds_datapoints_to_alarm    = var.datapoints_to_alarm
  rds_statistic              = var.statistic
}

module "rds_instance_05_writer_alarm" {
  source                     = "./modules/Alarms"
  type                       = "rds"
  rds_alarm_prefix           = "${var.env_name}-${var.region}-instance-05-RDS-WRITER"
  rds_db_instance_identifier = "instance-05"
  rds_cpu_threshold          = var.cpu_threshold_writer
  rds_connection_threshold   = var.connection_threshold_writer
  rds_period                 = var.period
  rds_evaluation_periods     = var.evaluation_periods
  rds_datapoints_to_alarm    = var.datapoints_to_alarm
  rds_statistic              = var.statistic
}

module "rds_instance_06_writer_alarm" {
  source                     = "./modules/Alarms"
  type                       = "rds"
  rds_alarm_prefix           = "${var.env_name}-${var.region}-instance-06-RDS-WRITER"
  rds_db_instance_identifier = "instance-06"
  rds_cpu_threshold          = var.cpu_threshold_writer
  rds_connection_threshold   = var.connection_threshold_writer
  rds_period                 = var.period
  rds_evaluation_periods     = var.evaluation_periods
  rds_datapoints_to_alarm    = var.datapoints_to_alarm
  rds_statistic              = var.statistic
}

module "rds_instance_07_writer_alarm" {
  source                     = "./modules/Alarms"
  type                       = "rds"
  rds_alarm_prefix           = "${var.env_name}-${var.region}-instance-07-RDS-WRITER"
  rds_db_instance_identifier = "instance-07"
  rds_cpu_threshold          = var.cpu_threshold_writer
  rds_connection_threshold   = var.connection_threshold_writer
  rds_period                 = var.period
  rds_evaluation_periods     = var.evaluation_periods
  rds_datapoints_to_alarm    = var.datapoints_to_alarm
  rds_statistic              = var.statistic
}

module "rds_instance_08_writer_alarm" {
  source                     = "./modules/Alarms"
  type                       = "rds"
  rds_alarm_prefix           = "${var.env_name}-${var.region}-instance-08-RDS-WRITER"
  rds_db_instance_identifier = "instance-08"
  rds_cpu_threshold          = var.cpu_threshold_writer
  rds_connection_threshold   = var.connection_threshold_writer
  rds_period                 = var.period
  rds_evaluation_periods     = var.evaluation_periods
  rds_datapoints_to_alarm    = var.datapoints_to_alarm
  rds_statistic              = var.statistic
}

module "rds_instance_09_writer_alarm" {
  source                     = "./modules/Alarms"
  type                       = "rds"
  rds_alarm_prefix           = "${var.env_name}-${var.region}-instance-09-RDS-WRITER"
  rds_db_instance_identifier = "instance-09"
  rds_cpu_threshold          = var.cpu_threshold_writer
  rds_connection_threshold   = var.connection_threshold_writer
  rds_period                 = var.period
  rds_evaluation_periods     = var.evaluation_periods
  rds_datapoints_to_alarm    = var.datapoints_to_alarm
  rds_statistic              = var.statistic
}

module "rds_instance_10_writer_alarm" {
  source                     = "./modules/Alarms"
  type                       = "rds"
  rds_alarm_prefix           = "${var.env_name}-${var.region}-instance-10-RDS-WRITER"
  rds_db_instance_identifier = "instance-10"
  rds_cpu_threshold          = var.cpu_threshold_writer
  rds_connection_threshold   = var.connection_threshold_writer
  rds_period                 = var.period
  rds_evaluation_periods     = var.evaluation_periods
  rds_datapoints_to_alarm    = var.datapoints_to_alarm
  rds_statistic              = var.statistic
}

# SQS Queue Alarms

module "sqs_night_audit_alarm" {
  source                       = "./modules/Alarms"
  type                         = "sqs"
  alarm_prefix                 = "${var.env_name}-${var.region}-sqs-night-audit"
  queue_name                   = "sqs-night-audit"
  visible_threshold            = var.sqs_thresholds["sqs-night-audit"].visible
  oldest_message_age_threshold = var.sqs_thresholds["sqs-night-audit"].oldest_age
}

module "sqs_pre_night_audit_alarm" {
  source                       = "./modules/Alarms"
  type                         = "sqs"
  alarm_prefix                 = "${var.env_name}-${var.region}-sqs-pre-night-audit"
  queue_name                   = "sqs-pre-night-audit"
  visible_threshold            = var.sqs_thresholds["sqs-pre-night-audit"].visible
  oldest_message_age_threshold = var.sqs_thresholds["sqs-pre-night-audit"].oldest_age
}

module "sqs_push_down_to_slave_alarm" {
  source                       = "./modules/Alarms"
  type                         = "sqs"
  alarm_prefix                 = "${var.env_name}-${var.region}-sqs-push-down-to-slave"
  queue_name                   = "sqs-push-down-to-slave"
  visible_threshold            = var.sqs_thresholds["sqs-push-down-to-slave"].visible
  oldest_message_age_threshold = var.sqs_thresholds["sqs-push-down-to-slave"].oldest_age
}

module "queue_1_alarm" {
  source                       = "./modules/Alarms"
  type                         = "sqs"
  alarm_prefix                 = "${var.env_name}-${var.region}-queue-1"
  queue_name                   = "queue-1"
  visible_threshold            = var.sqs_thresholds["queue-1"].visible
  oldest_message_age_threshold = var.sqs_thresholds["queue-1"].oldest_age
}

module "queue_2_alarm" {
  source                       = "./modules/Alarms"
  type                         = "sqs"
  alarm_prefix                 = "${var.env_name}-${var.region}-queue-2"
  queue_name                   = "queue-2"
  visible_threshold            = var.sqs_thresholds["queue-2"].visible
  oldest_message_age_threshold = var.sqs_thresholds["queue-2"].oldest_age
}

module "queue_3_alarm" {
  source                       = "./modules/Alarms"
  type                         = "sqs"
  alarm_prefix                 = "${var.env_name}-${var.region}-queue-3"
  queue_name                   = "queue-3"
  visible_threshold            = var.sqs_thresholds["queue-3"].visible
  oldest_message_age_threshold = var.sqs_thresholds["queue-3"].oldest_age
}
