FROM ubuntu:wily
MAINTAINER gom "gomgom68@gmail.com"

# Get noninteractive frontend for Debian to avoid some problems:
#    debconf: unable to initialize frontend: Dialog
ENV DEBIAN_FRONTEND noninteractive


# apt-get
RUN sed -i s/us.archive.ubuntu.com/ftp.jaist.ac.jp/ /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 575159689BEFB442
RUN echo 'deb http://download.fpcomplete.com/ubuntu wily main'| tee /etc/apt/sources.list.d/fpco.list
RUN apt-get update
RUN apt-get install -qq -y --force-yes openssh-server wget curl stack


# sshd
RUN mkdir -p /var/run/sshd
RUN useradd --create-home -s /bin/bash ubuntu
RUN echo "ubuntu:ubuntu" | chpasswd
RUN gpasswd -a ubuntu sudo

RUN echo 'eval "$(stack --bash-completion-script stack)"' >> /home/ubuntu/.bashrc

EXPOSE 22

# sshd with foreground
CMD ["/usr/sbin/sshd", "-D"]
