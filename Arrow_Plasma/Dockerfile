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

RUN wget https://github.com/facebook/zstd/releases/download/v1.4.8/zstd-1.4.8.tar.gz \
    && tar -xf zstd-1.4.8.tar.gz && cd zstd-1.4.8/build/cmake && mkdir build && cd build \
    && cmake ../ && make -j $(nproc) && make install

RUN mkdir libre2-dev && cd libre2-dev && apt-get source libre2-dev && cd re2-* \
    && mkdir build && cd build && ../re2/make_perl_groups.pl > ../re2/perl_groups.cc \
    && apt install python3-six unicode-data -y \
    && ../re2/make_unicode_casefold.py > ../re2/unicode_casefold.cc \
    && ../re2/make_unicode_groups.py > ../re2/unicode_groups.cc \
    && cmake ../ && make -j $(nproc) && make install

COPY ./CMakeLists.txt /root/CMakeLists.txt
RUN mkdir build && cd build && cmake ../
