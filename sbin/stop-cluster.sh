component_path="/d2/bigdata"
${component_path}/all.sh "${component_path}/zookeeper/bin/zkServer.sh status"
hostnames=("foo1" "foo2" "foo3" "foo4" "foo5" "foo6" "foo7")
for hostname in ${hostnames[@]};do
echo "====================== Hello "$hostname "==================="
ssh $hostname "
if [ ${hostname} == 'foo1' ] || [ ${hostname} == 'foo2' ];then
${component_path}/spark/sbin/stop-all.sh
${component_path}/hbase/bin/hbase-daemon.sh stop thrift
${component_path}/hbase/bin/stop-hbase.sh
${component_path}/hadoop/sbin/stop-balancer.sh 
${component_path}/hadoop/sbin/stop-all.sh
fi
if [ ${hostname} == 'foo3' ];then
  ${component_path}/hadoop/sbin/stop-yarn.sh
fi
if [ ${hostname} == 'foo4' ];then
${component_path}/hadoop/sbin/mr-jobhistory-daemon.sh stop historyserver
fi"
if [ ${hostname} == 'foo6' ] || [ ${hostname} == 'foo7' ]; then
${component_path}/spark/sbin/stop-all.sh
${component_path}/hbase/bin/hbase-daemon.sh stop thrift
${component_path}/hbase/bin/stop-hbase.sh
${component_path}/hadoop/sbin/stop-balancer.sh 
${component_path}/hadoop/sbin/stop-all.sh
fi
done
${component_path}/all.sh "${component_path}/zookeeper/bin/zkServer.sh stop"
