FROM ubuntu

RUN apt update && apt install ca-certificates -y
COPY ./sources.list /etc/apt/sources.list

RUN apt update

COPY ./arrow_install.sh /root/arrow_install.sh
RUN apt install sudo lsb-release wget -y && /root/arrow_install.sh

RUN apt install cmake g++ -y

WORKDIR /root

RUN apt install dpkg-dev -y

RUN apt install flex libbison-dev libboost-dev libboost-filesystem-dev libboost-thread-dev libboost-test-dev -y \
    && mkdir libthrift-dev && cd libthrift-dev && apt-get source libthrift-dev && cd thrift-* \
    && cd build && cmake ../ -DBUILD_JAVASCRIPT=OFF -DBUILD_NODEJS=OFF \
    && make -j $(nproc) && make install

RUN apt install wget && wget https://github.com/lz4/lz4/archive/refs/tags/v1.9.4.tar.gz \
    && tar -xf v1.9.4.tar.gz && cd lz4-1.9.4/build/cmake && mkdir build && cd build \
    && cmake ../ && make -j $(nproc) && make install

COPY ./CMakeLists.txt /root/CMakeLists.txt
RUN mkdir build && cd build && cmake ../
