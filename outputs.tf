output "rds_reader_alarm_names" {
  description = "Alarm names for RDS reader instances"
  value = {
    instance_01 = {
      cpu_alarm        = module.rds_instance_01_reader_alarm.cpu_alarm_name
      connection_alarm = module.rds_instance_01_reader_alarm.connection_alarm_name
    }
    instance_02 = {
      cpu_alarm        = module.rds_instance_02_reader_alarm.cpu_alarm_name
      connection_alarm = module.rds_instance_02_reader_alarm.connection_alarm_name
    }
    instance_03 = {
      cpu_alarm        = module.rds_instance_03_reader_alarm.cpu_alarm_name
      connection_alarm = module.rds_instance_03_reader_alarm.connection_alarm_name
    }
    instance_04 = {
      cpu_alarm        = module.rds_instance_04_reader_alarm.cpu_alarm_name
      connection_alarm = module.rds_instance_04_reader_alarm.connection_alarm_name
    }
    instance_05 = {
      cpu_alarm        = module.rds_instance_05_reader_alarm.cpu_alarm_name
      connection_alarm = module.rds_instance_05_reader_alarm.connection_alarm_name
    }
    instance_06 = {
      cpu_alarm        = module.rds_instance_06_reader_alarm.cpu_alarm_name
      connection_alarm = module.rds_instance_06_reader_alarm.connection_alarm_name
    }
    instance_07 = {
      cpu_alarm        = module.rds_instance_07_reader_alarm.cpu_alarm_name
      connection_alarm = module.rds_instance_07_reader_alarm.connection_alarm_name
    }
    instance_08 = {
      cpu_alarm        = module.rds_instance_08_reader_alarm.cpu_alarm_name
      connection_alarm = module.rds_instance_08_reader_alarm.connection_alarm_name
    }
    instance_09 = {
      cpu_alarm        = module.rds_instance_09_reader_alarm.cpu_alarm_name
      connection_alarm = module.rds_instance_09_reader_alarm.connection_alarm_name
    }
    instance_10 = {
      cpu_alarm        = module.rds_instance_10_reader_alarm.cpu_alarm_name
      connection_alarm = module.rds_instance_10_reader_alarm.connection_alarm_name
    }
  }
}

output "rds_writer_alarm_names" {
  description = "Alarm names for RDS writer instances"
  value = {
    instance_01 = {
      cpu_alarm        = module.rds_instance_01_writer_alarm.cpu_alarm_name
      connection_alarm = module.rds_instance_01_writer_alarm.connection_alarm_name
    }
    instance_02 = {
      cpu_alarm        = module.rds_instance_02_writer_alarm.cpu_alarm_name
      connection_alarm = module.rds_instance_02_writer_alarm.connection_alarm_name
    }
    instance_03 = {
      cpu_alarm        = module.rds_instance_03_writer_alarm.cpu_alarm_name
      connection_alarm = module.rds_instance_03_writer_alarm.connection_alarm_name
    }
    instance_04 = {
      cpu_alarm        = module.rds_instance_04_writer_alarm.cpu_alarm_name
      connection_alarm = module.rds_instance_04_writer_alarm.connection_alarm_name
    }
    instance_05 = {
      cpu_alarm        = module.rds_instance_05_writer_alarm.cpu_alarm_name
      connection_alarm = module.rds_instance_05_writer_alarm.connection_alarm_name
    }
    instance_06 = {
      cpu_alarm        = module.rds_instance_06_writer_alarm.cpu_alarm_name
      connection_alarm = module.rds_instance_06_writer_alarm.connection_alarm_name
    }
    instance_07 = {
      cpu_alarm        = module.rds_instance_07_writer_alarm.cpu_alarm_name
      connection_alarm = module.rds_instance_07_writer_alarm.connection_alarm_name
    }
    instance_08 = {
      cpu_alarm        = module.rds_instance_08_writer_alarm.cpu_alarm_name
      connection_alarm = module.rds_instance_08_writer_alarm.connection_alarm_name
    }
    instance_09 = {
      cpu_alarm        = module.rds_instance_09_writer_alarm.cpu_alarm_name
      connection_alarm = module.rds_instance_09_writer_alarm.connection_alarm_name
    }
    instance_10 = {
      cpu_alarm        = module.rds_instance_10_writer_alarm.cpu_alarm_name
      connection_alarm = module.rds_instance_10_writer_alarm.connection_alarm_name
    }
  }
}

output "sqs_alarm_names" {
  description = "Alarm names for SQS queues"
  value = {
    sqs_night_audit = {
      visible_alarm = module.sqs_night_audit_alarm.visible_messages_alarm_name
      age_alarm     = module.sqs_night_audit_alarm.oldest_message_alarm_name
    }
  }
}
