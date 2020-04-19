base_dir=$(dirname $0)

opt_path="/opt"
KAFKA="yes"
KAFKA_CONF="${opt_path}/kafka/config/server.properties"

prefix="pssh -i -h ./hosts.txt"

${prefix} rm -rf ${opt_path}/hadoop/logs/*
${prefix} rm -rf ${opt_path}/kafka/logs/*