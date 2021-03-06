#!/bin/bash

set -e

yum install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make -y

yum -y install epel-release

yum install python-pip  wget -y

cd /opt/ && wget https://www.python.org/ftp/python/3.6.4/Python-3.6.4.tar.xz

xz -d Python-3.6.4.tar.xz && tar -xf Python-3.6.4.tar

cd Python-3.6.4 && ./configure prefix=/usr/local/python3 && make && make install

mv /usr/bin/python /usr/bin/python.bak

ln -s /usr/local/python3/bin/python3.6 /usr/bin/python

sed -i 's/\#\!\/usr\/bin\/python/\#\!\/usr\/bin\/python2/g' /usr/bin/yum

sed -i 's/\#\!\/usr\/bin\/python/\#\!\/usr\/bin\/python2/g' /usr/libexec/urlgrabber-ext-down

mv /usr/bin/pip /usr/bin/pip.bak 

ln -s /usr/local/python3/bin/pip3 /usr/bin/pip

echo 'export PATH=$PATH:/usr/local/python3/bin' >>/etc/profile

source /etc/profile

echo "输入python测试，再执行yum测试。"