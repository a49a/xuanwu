#!/bin/sh
component_path="/d2/bigdata"
${component_path}/all.sh "${component_path}/zookeeper/bin/zkServer.sh start"
${component_path}/all.sh "${component_path}/zookeeper/bin/zkServer.sh status"
master_host="foo1"

ssh ${master_host} ${component_path}/hadoop/sbin/start-all.sh
ssh ${master_host} ${component_path}/hadoop/sbin/start-balancer.sh
ssh ${master_host} ${component_path}/hbase/bin/start-hbase.sh
ssh ${master_host} ${component_path}/hbase/bin/hbase-daemon.sh start thrift
ssh ${master_host} "echo \"balance_switch true\" | hbase shell"
ssh foo2 ${component_path}/hadoop/sbin/start-balancer.sh

ssh foo3 ${component_path}/hadoop/sbin/start-yarn.sh
ssh foo3 ${component_path}/hadoop/sbin/yarn-daemon.sh start resourcemanager
ssh foo3 ${component_path}/hadoop/sbin/yarn-daemon.sh start nodemanager

ssh foo4 ${component_path}/hadoop/sbin/yarn-daemon.sh start resourcemanager
ssh foo4 ${component_path}/hadoop/sbin/yarn-daemon.sh start nodemanage

ssh foo3 ${component_path}/hadoop/sbin/mr-jobhistory-daemon.sh start historyserver
ssh foo1 ${component_path}/spark/sbin/start-all.sh
