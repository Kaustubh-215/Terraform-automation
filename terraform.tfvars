# RDS Alarm Configuration Per Region
alarm_config_by_region = {
  "us-west-2" = {
    cpu_threshold_reader        = 65
    cpu_threshold_writer        = 50
    connection_threshold_reader = 2100
    connection_threshold_writer = 1700
    period                      = 120
    evaluation_periods          = 2
    datapoints_to_alarm         = 4
    statistic                   = "Average"
  },
  "us-east-1" = {
    cpu_threshold_reader        = 60
    cpu_threshold_writer        = 48
    connection_threshold_reader = 2000
    connection_threshold_writer = 1600
    period                      = 120
    evaluation_periods          = 2
    datapoints_to_alarm         = 4
    statistic                   = "Average"
  },
  "ap-southeast-1" = {
    cpu_threshold_reader        = 70
    cpu_threshold_writer        = 55
    connection_threshold_reader = 1900
    connection_threshold_writer = 1650
    period                      = 120
    evaluation_periods          = 2
    datapoints_to_alarm         = 4
    statistic                   = "Average"
  }
}

# SQS Queues - West Region
sqs_queues_west = [
  {
    name                         = "order-queue"
    visible_threshold            = 100
    oldest_message_age_threshold = 300
  },
  {
    name                         = "audit-events"
    visible_threshold            = 50
    oldest_message_age_threshold = 600
  }
]

# SQS Queues - East Region
sqs_queues_east = [
  {
    name                         = "email-queue"
    visible_threshold            = 75
    oldest_message_age_threshold = 450
  },
  {
    name                         = "workflow-queue"
    visible_threshold            = 120
    oldest_message_age_threshold = 500
  }
]

#SQS Queues - APAC Region
sqs_queues_apac = [
  {
    name                         = "notify-queue"
    visible_threshold            = 80
    oldest_message_age_threshold = 350
  },
  {
    name                         = "logs-queue"
    visible_threshold            = 40
    oldest_message_age_threshold = 500
  }
]
