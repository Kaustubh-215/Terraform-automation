rds_clusters = [
  {
    name   = "west-01"
    reader = "west-01-reader-db"
    writer = "west-01-writer-db"
  },
  {
    name   = "west-02"
    reader = "west-02-reader-db"
    writer = "west-02-writer-db"
  },
  {
    name   = "west-03"
    reader = "west-03-reader-db"
    writer = "west-03-writer-db"
  },
  {
    name   = "west-04"
    reader = "west-04-reader-db"
    writer = "west-04-writer-db"
  }
]


rds_clusters_east = [
  {
    name   = "east-01"
    reader = "east-01-reader-db"
    writer = "east-01-writer-db"
  },
  {
    name   = "east-02"
    reader = "east-02-reader-db"
    writer = "east-02-writer-db"
  },
  {
    name   = "east-03"
    reader = "east-03-reader-db"
    writer = "east-03-writer-db"
  },
  {
    name   = "east-04"
    reader = "east-04-reader-db"
    writer = "east-04-writer-db"
  }
]

rds_clusters_apac = [
  {
    name   = "apac-01"
    reader = "apac-01-reader-db"
    writer = "apac-01-writer-db"
  },
  {
    name   = "apac-02"
    reader = "apac-02-reader-db"
    writer = "apac-02-writer-db"
  },
  {
    name   = "apac-03"
    reader = "apac-03-reader-db"
    writer = "apac-03-writer-db"
  },
  {
    name   = "apac-04"
    reader = "apac-04-reader-db"
    writer = "apac-04-writer-db"
  }
]

sqs_queues = [
  {
    name                         = "order-processing-queue"
    visible_threshold            = 100
    oldest_message_age_threshold = 300
  },
  {
    name                         = "payment-events-queue"
    visible_threshold            = 100
    oldest_message_age_threshold = 300
  }
]

sqs_queues_east = [
  {
    name                         = "order-processing-queue"
    visible_threshold            = 100
    oldest_message_age_threshold = 300
  },
  {
    name                         = "payment-events-queue"
    visible_threshold            = 100
    oldest_message_age_threshold = 300
  }
]

sqs_queues_apac = [
  {
    name                         = "order-processing-queue-apac"
    visible_threshold            = 100
    oldest_message_age_threshold = 300
  },
  {
    name                         = "payment-events-queue-apac"
    visible_threshold            = 100
    oldest_message_age_threshold = 300
  }
]
