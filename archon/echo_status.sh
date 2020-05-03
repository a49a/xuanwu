opt_path="/opt"
prefix="pssh -i -h ./hosts.txt"

${prefix} ${opt_path}/zookeeper/bin/zkServer.sh status
${prefix} jps
${prefix} df -h
${prefix} hadoop version
echo "var du"
${prefix} du -h --max-depth=1 /var
