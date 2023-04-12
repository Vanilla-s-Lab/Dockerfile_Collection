FROM ubuntu

RUN apt update && apt install ca-certificates -y
COPY ./sources.list /etc/apt/sources.list

RUN apt update

COPY ./arrow_install.sh /root/arrow_install.sh
RUN apt install sudo lsb-release wget -y && /root/arrow_install.sh

RUN apt install cmake g++ -y

WORKDIR /root
COPY ./CMakeLists.txt /root/CMakeLists.txt
RUN mkdir build && cd build && cmake ../
