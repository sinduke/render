# 使用 Ubuntu 22.04 作为基础镜像
FROM ubuntu:22.04

# 安装 Shellinabox 和其他需要的服务
RUN apt-get update && \
    apt-get install -y shellinabox ufw systemd sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 设置 root 用户的密码为 'df19930222'
RUN echo 'root:Df19930222' | chpasswd

# 暴露 22，80，443 端口
EXPOSE 22
EXPOSE 80
EXPOSE 443

# 启动 Shellinabox
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]

