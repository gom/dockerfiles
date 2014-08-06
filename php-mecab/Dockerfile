FROM ubuntu
MAINTAINER gom "gomgom68@gmail.com"

# apt-get
RUN sed -i s/us.archive.ubuntu.com/ftp.jaist.ac.jp/ /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -qq -y --force-yes openssh-server php5 php5-dev php-pear libmecab-dev mecab mecab-ipadic-utf8 vim git curl

# php-mecab
RUN pear channel-discover pecl.opendogs.org && \
    echo | pear install opendogs/mecab-beta

RUN echo 'extension=mecab.so' > /etc/php5/cli/conf.d/30-mecab.ini && \
    echo 'extension=mecab.so' > /etc/php5/apache2/conf.d/30-mecab.ini

ADD share/sample.php /usr/local/share/

# sshd
RUN mkdir -p /var/run/sshd
RUN useradd --create-home -s /bin/bash ubuntu
RUN echo "ubuntu:ubuntu" | chpasswd
RUN gpasswd -a ubuntu sudo

RUN /etc/init.d/apache2 restart

EXPOSE 22

# sshd with foreground
CMD ["/usr/sbin/sshd", "-D"]
