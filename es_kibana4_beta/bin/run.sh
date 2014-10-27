#!/bin/sh
service nginx start
service elasticsearch start
service td-agent start
#service kibana start

/usr/sbin/sshd -D
