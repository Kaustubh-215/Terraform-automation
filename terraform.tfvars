alarm_config = {
  cpu_threshold_reader        = 60
  cpu_threshold_writer        = 50
  connection_threshold_reader = 1800
  connection_threshold_writer = 2100
  period                      = 300
  evaluation_periods          = 2
  datapoints_to_alarm         = 4
  statistic                   = "Average"
}

sqs_queues = [
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

