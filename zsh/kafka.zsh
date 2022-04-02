export BOOTSTRAP_SERVER=localhost:9092
export ZOOKEEPER=localhost:2181

kafka-start() {
session_name="kafka-server-local"

tmux new -d -s $session_name -n $session_name -c ~/kafka

tmux send -t $session_name:1 "bin/zookeeper-server-start.sh config/zookeeper.properties" C-m

tmux split-window -t $session_name:1 -c "#{pane_current_path}"

tmux send -t $session_name:1 "bin/kafka-server-start.sh config/server.properties" C-m

tmux attach
}

kafka-stop() {
session_name="kafka-server-local"
tmux split-window -t $session_name:1 -c "#{pane_current_path}"
tmux send -t $session_name:1 "bin/kafka-server-stop.sh" C-m
tmux send -t $session_name:1 "bin/zookeeper-server-stop.sh" C-m
tmux kill-session -t $session_name
}

kafka-clean-console-groups() {
for group in $(kafka-consumer-groups.sh --bootstrap-server ${BOOTSTRAP_SERVER:-localhost:9092} --list | grep console-); do
  kafka-consumer-groups --bootstrap-server ${BOOTSTRAP_SERVER:-localhost:9092} --delete --group $group
done
}

kafka-describe-all-consumer-groups() {
for group in $(kafka-consumer-groups.sh --bootstrap-server ${BOOTSTRAP_SERVER:-localhost:9092} --list); do
  kafka-consumer-groups --bootstrap-server ${BOOTSTRAP_SERVER:-localhost:9092} --describe --group $group
done
}

kafka-topic-messages-count() {
kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list ${BOOTSTRAP_SERVER:-localhost:9092} --topic $1 --time -1 | awk -F: '{total+=$3} END {print total}'
}

kafka-topics-messages-count-all() {
for topic in $(kafka-topics.sh --bootstrap-server ${BOOTSTRAP_SERVER:-localhost:9092} --list | grep -v -e "^_"); do
  echo "$topic\t$(kafka-topic-messages-count $topic)"
done
}
