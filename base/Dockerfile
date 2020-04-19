FROM debian:buster-slim
ADD sources.list /etc/apt/

RUN apt-get update;
RUN apt-get install -y openssh-server

# 创建用户
RUN useradd --create-home --no-log-init --shell /bin/bash foo
RUN adduser foo sudo
RUN echo "foo:bar" | chpasswd

# 容器启动以 foo用户登录
USER foo
WORKDIR /home/foo

RUN service sshd start

EXPOSE 22

CMD ["/bin/bash"]
