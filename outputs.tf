# ---------------------
# RDS Reader Alarms
# ---------------------

output "cpu_alarm_names_west" {
  value = {
    for key, mod in module.rds_alarms_west :
    key => mod.cpu_alarm_name
  }
}

output "connection_alarm_names_west" {
  value = {
    for key, mod in module.rds_alarms_west :
    key => mod.connection_alarm_name
  }
}

output "cpu_alarm_names_east" {
  value = {
    for key, mod in module.rds_alarms_east :
    key => mod.cpu_alarm_name
  }
}

output "connection_alarm_names_east" {
  value = {
    for key, mod in module.rds_alarms_east :
    key => mod.connection_alarm_name
  }
}

output "cpu_alarm_names_apac" {
  value = {
    for key, mod in module.rds_alarms_apac :
    key => mod.cpu_alarm_name
  }
}

output "connection_alarm_names_apac" {
  value = {
    for key, mod in module.rds_alarms_apac :
    key => mod.connection_alarm_name
  }
}

# ---------------------
# RDS Writer Alarms
# ---------------------

output "cpu_writer_alarm_names_west" {
  value = {
    for key, mod in module.rds_writer_alarms_west :
    key => mod.cpu_alarm_name
  }
}

output "connection_writer_alarm_names_west" {
  value = {
    for key, mod in module.rds_writer_alarms_west :
    key => mod.connection_alarm_name
  }
}

output "cpu_writer_alarm_names_east" {
  value = {
    for key, mod in module.rds_writer_alarms_east :
    key => mod.cpu_alarm_name
  }
}

output "connection_writer_alarm_names_east" {
  value = {
    for key, mod in module.rds_writer_alarms_east :
    key => mod.connection_alarm_name
  }
}

output "cpu_writer_alarm_names_apac" {
  value = {
    for key, mod in module.rds_writer_alarms_apac :
    key => mod.cpu_alarm_name
  }
}

output "connection_writer_alarm_names_apac" {
  value = {
    for key, mod in module.rds_writer_alarms_apac :
    key => mod.connection_alarm_name
  }
}

# ---------------------
# SQS Alarms
# ---------------------

output "visible_messages_alarm_names_west" {
  value = {
    for key, mod in module.sqs_alarms_west :
    key => mod.visible_messages_alarm_name
  }
}

output "oldest_message_alarm_names_west" {
  value = {
    for key, mod in module.sqs_alarms_west :
    key => mod.oldest_message_alarm_name
  }
}

output "visible_messages_alarm_names_east" {
  value = {
    for key, mod in module.sqs_alarms_east :
    key => mod.visible_messages_alarm_name
  }
}

output "oldest_message_alarm_names_east" {
  value = {
    for key, mod in module.sqs_alarms_east :
    key => mod.oldest_message_alarm_name
  }
}

output "visible_messages_alarm_names_apac" {
  value = {
    for key, mod in module.sqs_alarms_apac :
    key => mod.visible_messages_alarm_name
  }
}

output "oldest_message_alarm_names_apac" {
  value = {
    for key, mod in module.sqs_alarms_apac :
    key => mod.oldest_message_alarm_name
  }
}
