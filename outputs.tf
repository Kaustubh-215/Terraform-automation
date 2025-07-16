# RDS Outputs
output "rds_reader_cpu_alarms" {
  value = {
    for key, mod in module.rds_reader_alarms : key => mod.cpu_alarm_name
  }
}

output "rds_reader_connection_alarms" {
  value = {
    for key, mod in module.rds_reader_alarms : key => mod.connection_alarm_name
  }
}

output "rds_writer_cpu_alarms" {
  value = {
    for key, mod in module.rds_writer_alarms : key => mod.cpu_alarm_name
  }
}

output "rds_writer_connection_alarms" {
  value = {
    for key, mod in module.rds_writer_alarms : key => mod.connection_alarm_name
  }
}

# SQS Outputs
output "sqs_visible_alarms" {
  value = {
    for key, mod in module.sqs_alarms : key => mod.visible_messages_alarm_name
  }
}

output "sqs_oldest_message_alarms" {
  value = {
    for key, mod in module.sqs_alarms : key => mod.oldest_message_alarm_name
  }
}
