region         = "us-west-2"
aws_profile    = "default"
env_name       = "dev"

cpu_threshold_reader       = 75
connection_threshold_reader = 100
cpu_threshold_writer       = 80
connection_threshold_writer = 120

period              = 300
evaluation_periods  = 2
datapoints_to_alarm = 2
statistic           = "Average"

sqs_thresholds = {
  "sqs-night-audit" = {
    visible    = 60
    oldest_age = 200
  },
  "sqs-pre-night-audit" = {
    visible    = 50
    oldest_age = 180
  },
  "sqs-push-down-to-slave" = {
      visible    = 150
      oldest_age = 400
    },
  "queue-1" = {
    visible    = 40
    oldest_age = 160
  },
  "queue-2" = {
    visible    = 30
    oldest_age = 140
  },
  "queue-3" = {
    visible    = 20
    oldest_age = 120
  }
}
