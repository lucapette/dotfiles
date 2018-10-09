kafka-clean-console-groups() {
  for group in $(kafka-consumer-groups --bootstrap-server localhost:9092 --list | grep console-); do
    kafka-consumer-groups --bootstrap-server localhost:9092 --delete --group $group
  done
}

kafka-describe-all-consumer-groups() {
  for group in $(kafka-consumer-groups --bootstrap-server localhost:9092 --list); do
    kafka-consumer-groups --bootstrap-server localhost:9092 --describe --group $group
  done
}
