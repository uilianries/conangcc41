FROM centos:5

MAINTAINER Uilian Ries <uilianries@gmail.com>

RUN yum upgrade -y && \
    yum groupinstall -y 'Development Tools' && \
    yum install -y wget sudo bzip2 make xz nasm valgrind vim zlib openssl-devel &&\
    cd /tmp && \
    wget --no-check-certificate https://www.sqlite.org/2017/sqlite-autoconf-3170000.tar.gz && \
    tar zxf sqlite-autoconf-3170000.tar.gz && \
    cd sqlite-autoconf-3170000 && \
    ./configure && \
    make && \
    make install && \
    rm -rf /tmp/sqlite-* && \
    cd /tmp && \
    wget https://cmake.org/files/v3.6/cmake-3.6.3.tar.gz --no-check-certificate && \
    tar -xzf cmake-3.6.3.tar.gz && \
    cd cmake-3.6.3 && \
    ./bootstrap && \
    make && \
    make install && \
    rm -rf cmake-3.6.3* && \
    cd /tmp && \
    wget --no-check-certificate https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tar.xz && \
    unxz Python-2.7.13.tar.xz && \
    tar xf Python-2.7.13.tar && \
    cd Python-2.7.13 && \
    ./configure && \
    make && \
    make install && \
    rm -rf /tmp/Python* && \
    wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate && \
    python get-pip.py && \
    pip install -U pip && \
    pip install conan_package_tools && \
    groupadd 1001 -g 1001 && \
    groupadd 1000 -g 1000 && \
    useradd -m -s /bin/bash -g 1001 -G 1000 conan && \
    echo "conan:conan" | chpasswd && \
    usermod -aG wheel conan && \
    echo "conan ALL= NOPASSWD: ALL" >> /etc/sudoers && \
    mkdir -p /home/conan/.conan && \
    chown conan:conan /home/conan/.conan

USER conan
WORKDIR /home/conan
