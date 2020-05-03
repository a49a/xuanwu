base_dir=$(dirname $0)

hadoop_path=${base_dir}/../hadoop/base_etc
source_path=${hadoop_path}/capacity-scheduler.xml

path=/opt/hadoop/etc/hadoop/
tmp_path=${base_dir}/../hadoop/base_etc/yarn-site.xml

flink_lib=/opt/flink/lib
gz_path=${base_dir}/gz/flink-shaded-hadoop-2-uber-2.9.2-10.0.jar

# pscp -h hosts.txt ${tmp_path} ${path}
pscp -h hosts.txt /Users/wolf/opt/flink-1.10.0.zip /opt
