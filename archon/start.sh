base_dir=$(dirname $0)

opt_path="/opt"
# KAFKA="yes"
HADOOP="yes"
KAFKA_CONF="${opt_path}/kafka/config/server.properties"

prefix="pssh -i -h ./hosts.txt"

${prefix} ${opt_path}/zookeeper/bin/zkServer.sh start
${prefix} ${opt_path}/zookeeper/bin/zkServer.sh status

if [[ "x${HADOOP}" != "x" ]]; then
    ssh root@tail1 ${opt_path}/hadoop/sbin/start-dfs.sh
    ssh root@tail2 ${opt_path}/hadoop/sbin/start-yarn.sh
fi

if [[ "x${KAFKA}" != "x" ]]; then
    ${prefix} ${opt_path}/kafka/bin/kafka-server-start.sh ${KAFKA_CONF} 1>/dev/null 2>&1 &
fi

${prefix} jps
