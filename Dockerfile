FROM debian:buster

WORKDIR /

RUN apt update && \ 
    apt install git polipo -y && \
    git clone https://github.com/shadowsocksrr/shadowsocksr.git && \ 
    echo "socksParentProxy = 127.0.0.1:1080" >> /etc/polipo/config && \
    service polipo restart

CMD ["python", "/shadowsocksr/shadowsocks/local.py", "-c", "/config.json", "-d", "start"] 
