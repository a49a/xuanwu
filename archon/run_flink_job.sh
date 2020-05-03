flink/bin/flink run -d -m yarn-cluster -p 2 -yjm 1024m -ytm 1024m -yqu ana -ys 2 /opt/jars/me.yanri-jar-with-dependencies.jar

flink/bin/flink run -d -m yarn-cluster -p 4 -yjm 2048m -ytm 1000m -yqu default -ys 2 /opt/jars/me.yanri-jar-with-dependencies.jar

flink/bin/flink run -d -m yarn-cluster -p 1 -yjm 1024m -ytm 1024m -yqu ana -ys 1 /opt/jars/quasar-0.0.5-SNAPSHOT-all.jar -Dhost=tail1

yarn application -kill application_1587286542450_0003