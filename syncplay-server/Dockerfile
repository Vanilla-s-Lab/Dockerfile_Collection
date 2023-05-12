FROM alpine

# https://mirrors.bfsu.edu.cn/help/alpine/
# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.bfsu.edu.cn/g' /etc/apk/repositories
# https://mirrors.hit.edu.cn/#/doc/alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.hit.edu.cn/g' /etc/apk/repositories

RUN apk add syncplay
CMD syncplay-server
