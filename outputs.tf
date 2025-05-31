output "cpu_alarm_names" {
  value = {
    for key, mod in module.rds_alarms :
    key => mod.cpu_alarm_name
  }
}

output "connection_alarm_names" {
  value = {
    for key, mod in module.rds_alarms :
    key => mod.connection_alarm_name
  }
}

output "cpu_writer_alarm_names" {
  value = {
    for key, mod in module.rds_writer_alarms :
    key => mod.cpu_alarm_name
  }
}

output "connection_writer_alarm_names" {
  value = {
    for key, mod in module.rds_writer_alarms :
    key => mod.connection_alarm_name
  }
}

output "visible_messages_alarm_names" {
  value = {
    for key, mod in module.sqs_alarms :
    key => mod.visible_messages_alarm_name
  }
}

output "oldest_message_alarm_names" {
  value = {
    for key, mod in module.sqs_alarms :
    key => mod.oldest_message_alarm_name
  }
}

