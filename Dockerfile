FROM debian:stable-slim
ARG N2N_VERSION=2.6

# 清空所有现有的源列表，并添加清华大学源
RUN echo '' > /etc/apt/sources.list && \
    rm -rf /etc/apt/sources.list.d/* && \
    echo 'deb http://mirrors.tuna.tsinghua.edu.cn/debian/ stable main contrib non-free' > /etc/apt/sources.list && \
    echo 'deb http://mirrors.tuna.tsinghua.edu.cn/debian/ stable-updates main contrib non-free' >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y git autoconf make automake libtool
# 清理不再需要的缓存和临时文件
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /opt
RUN git clone https://github.com/ntop/n2n.git && cd n2n && git checkout $N2N_VERSION && ./autogen.sh && ./configure && make && make install

ENTRYPOINT  ["edge"]
