FROM ubuntu
MAINTAINER gom "gomgom68@gmail.com"

# apt-get
RUN sed -i s/us.archive.ubuntu.com/ftp.jaist.ac.jp/ /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -qq -y --force-yes openssh-server wget

# influxdb
ADD http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb /var/tmp/
RUN dpkg -i /var/tmp/influxdb_latest_amd64.deb

# sshd
RUN mkdir -p /var/run/sshd
RUN useradd --create-home -s /bin/bash ubuntu
RUN echo "ubuntu:ubuntu" | chpasswd
RUN gpasswd -a ubuntu sudo

# 8083: http admin, 8086: http api, 8099: cluster
EXPOSE 22 8083 8086 8099

# sshd with foreground
CMD ["/usr/bin/influxdb", "--config=/opt/influxdb/shared/config.toml", "--pidfile=/tmp/influxdb.pid"]
