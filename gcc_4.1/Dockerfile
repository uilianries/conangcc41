FROM centos:5

MAINTAINER Uilian Ries <uilianries@gmail.com>

# Development tools
RUN yum upgrade -y && yum groupinstall -y 'Development Tools' 
# Dependencies
RUN yum install -y wget sudo bzip2 make xz nasm valgrind vim zlib openssl-devel curl-devel
# Sqlite3
RUN cd /tmp && wget --no-check-certificate -q -t 0 -c https://www.sqlite.org/2017/sqlite-autoconf-3170000.tar.gz && tar zxf sqlite-autoconf-3170000.tar.gz && cd sqlite-autoconf-3170000 && ./configure && make && make install && rm -rf /tmp/sqlite-*
# OpenSSL 1.0.2a
RUN cd /tmp && wget --no-check-certificate -q -t 0 -c https://www.openssl.org/source/openssl-1.0.2a.tar.gz && tar -zxf openssl-1.0.2a.tar.gz && cd openssl-1.0.2a && ./config -fPIC --prefix=/usr --openssldir=/usr/include/openssl shared && make && make install && rm -rf /tmp/openssl-*
# CMake 3.6
RUN cd /tmp && wget --no-check-certificate -q -t 0 -c https://cmake.org/files/v3.6/cmake-3.6.3.tar.gz && tar -xzf cmake-3.6.3.tar.gz && cd cmake-3.6.3 && ./bootstrap && make && make install && rm -rf /tmp/cmake-*
# Git 2.11.1
RUN cd /tmp && wget --no-check-certificate -q -t 0 -c https://www.kernel.org/pub/software/scm/git/git-2.11.1.tar.gz && tar -zxf git-2.11.1.tar.gz && cd git-2.11.1 && ./configure && make && make install && rm -rf /tmp/git-*
# Python 2.7
RUN cd /tmp && wget --no-check-certificate -q -t 0 -c https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tar.xz && unxz Python-2.7.13.tar.xz && tar xf Python-2.7.13.tar && cd Python-2.7.13 && ./configure && make && make install && rm -rf /tmp/Python*
# Python pip
RUN cd /tmp && wget --no-check-certificate -q -t 0 -c https://bootstrap.pypa.io/get-pip.py && python get-pip.py && rm -f get-pip.py
# Conan 
RUN pip install -U pip && pip install conan conan_package_tools

# Sudo user
RUN groupadd 1001 -g 1001 && groupadd 1000 -g 1000
RUN useradd -m -s /bin/bash -g 1001 -G 1000 conan && echo "conan:conan" | chpasswd && usermod -aG wheel conan
RUN echo "conan ALL= NOPASSWD: ALL" >> /etc/sudoers && mkdir -p /home/conan/.conan && chown conan:1001 /home/conan/.conan
# Solve sudo tty
RUN sed -i -e 's/Defaults    requiretty/# Defaults    requiretty/g' /etc/sudoers

USER conan
WORKDIR /home/conan
