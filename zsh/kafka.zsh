export BOOTSTRAP_SERVER=localhost:9092
export ZOOKEEPER=localhost:2181
export KAFKA_HOME=$HOME/kafka

kafka-start() {
session_name="kafka-server-local"

tmux has-session -t $session_name 2>/dev/null

if [ $? != 0 ]; then
  tmux new -d -s $session_name -n $session_name -c $KAFKA_HOME

  tmux send -t $session_name:1 "bin/zookeeper-server-start.sh config/zookeeper.properties" C-m

  tmux split-window -t $session_name:1 -c "#{pane_current_path}"

  tmux send -t $session_name:1 "bin/kafka-server-start.sh config/server.properties" C-m
fi

tmux attach-session -t $session_name
}

kafka-clean-console-groups() {
for group in $(${KAFKA_HOME}/bin/kafka-consumer-groups.sh --bootstrap-server ${BOOTSTRAP_SERVER} --list | grep console-); do
  echo "deleting $group"
  ${KAFKA_HOME}/bin/kafka-consumer-groups.sh --bootstrap-server ${BOOTSTRAP_SERVER} --delete --group $group
done
}

kafka-console-consumer() {
${KAFKA_HOME}/bin/kafka-console-consumer.sh --bootstrap-server ${BOOTSTRAP_SERVER} $@
}

kafka-console-producer() {
${KAFKA_HOME}/bin/kafka-console-producer.sh --bootstrap-server ${BOOTSTRAP_SERVER} $@
}

kafka-describe-all-consumer-groups() {
for group in $(${KAFKA_HOME}/bin/kafka-consumer-groups.sh --bootstrap-server ${BOOTSTRAP_SERVER} --list); do
  ${KAFKA_HOME}/bin/kafka-consumer-groups.sh --bootstrap-server ${BOOTSTRAP_SERVER} --describe --group $group
done
}


kafka-topics() {
${KAFKA_HOME}/bin/kafka-topics.sh --bootstrap-server ${BOOTSTRAP_SERVER} $@
}
kafka-topics-messages-count-all() {
for topic in $(${KAFKA_HOME}/bin/kafka-topics.sh --bootstrap-server ${BOOTSTRAP_SERVER} --list | grep -v -e "^_"); do
  echo "$topic\t$(kafka-topic-messages-count $topic)"
done
}

kafka-topic-messages-count() {
$KAFKA_HOME/bin/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list ${BOOTSTRAP_SERVER} --topic $1 --time -1 | awk -F: '{total+=$3} END {print total}'
}

