user=foo
prefix="pssh -i -h ./hosts.txt"
pscp_prefix="pscp -h hosts.txt"

#${pscp_prefix} 

${prefix} tar -zxf /opt/tar/hadoop-2.9.2.tar.gz -C /opt/

${prefix} chown -R ${user} /opt/hadoop
