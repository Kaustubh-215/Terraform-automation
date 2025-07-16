aws_profile       = "Kaustubh"
env_name          = "dev"
region            = "us-east-1"

cpu_threshold_reader        = 55
cpu_threshold_writer        = 60
connection_threshold_reader = 75
connection_threshold_writer = 90
period                      = 300
evaluation_periods          = 2
datapoints_to_alarm         = 2
statistic                   = "Average"

sqs_queues = [
  {
    name                         = "dev-east-queue"
    visible_threshold            = 60
    oldest_message_age_threshold = 200
  }
]
