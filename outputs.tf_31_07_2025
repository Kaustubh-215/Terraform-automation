output "rds_reader_alarm_names" {
  description = "Alarm names for RDS reader instances"
  value = {
    for name, mod in module.rds_reader_alarms : name => {
      cpu_alarm        = mod.cpu_alarm_name
      connection_alarm = mod.connection_alarm_name
    }
  }
}

output "rds_writer_alarm_names" {
  description = "Alarm names for RDS writer instances"
  value = {
    for name, mod in module.rds_writer_alarms : name => {
      cpu_alarm        = mod.cpu_alarm_name
      connection_alarm = mod.connection_alarm_name
    }
  }
}

output "sqs_alarm_names" {
  description = "Alarm names for SQS queues"
  value = {
    for name, mod in module.sqs_alarms : name => {
      visible_alarm = mod.visible_messages_alarm_name
      age_alarm     = mod.oldest_message_alarm_name
    }
  }
}
