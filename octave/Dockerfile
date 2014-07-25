FROM ubuntu
MAINTAINER gom "gomgom68@gmail.com"

# apt-get
RUN sed -i s/us.archive.ubuntu.com/ftp.jaist.ac.jp/ /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -qq -y --force-yes openssh-server octave

# sshd
RUN mkdir -p /var/run/sshd
RUN useradd --create-home -s /bin/bash ubuntu ; \
    gpasswd -a ubuntu sudo ; \
    echo "ubuntu:ubuntu" | chpasswd;

EXPOSE 22

# sshd with foreground
CMD ["/usr/sbin/sshd", "-D"]
