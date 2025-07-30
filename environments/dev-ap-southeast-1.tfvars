region         = "ap-southeast-1"   # APAC region
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
  }
}
