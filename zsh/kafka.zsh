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

kafka-topic-messages-count() {
kafka-run-class kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic $1 --time -1 | awk -F: '{total+=$3} END {print total}'
}

kafka-topics-messages-count-all() {
for topic in $(kafka-topics --zookeeper localhost:2181 --list | grep -v -e "^_"); do
  echo "$topic\t$(kafka-topic-messages-count $topic)"
done
}
