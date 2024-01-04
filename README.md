# docker-n2n

基于docker的n2n，可以在docker运行n2n edge客户端，默认版本是v2.6。
可以给docker build传递N2N_VERSION参数，使用自定义版本的n2n。

## 如何构建docker镜像

    docker build -t n2n:v2.6 .

构建其他版本

    docker build --build-arg N2N_VERSION=3.0 -t n2n:3.0 .

## 如何运行

    docker run -it --rm --network=host --privileged --name n2n-edge n2n:v2.6 edge -c mynetwork -k mysecretpass -a 192.168.100.1 -f -l supernode.ntop.org:7777 -f

## 如何后台运行

在前面命令的基础上，docker run 加上 -d 参数即可

    docker run -itd --rm --network=host --privileged --name n2n-edge n2n:v2.6 edge -c mynetwork -k mysecretpass -a 192.168.100.1 -f -l supernode.ntop.org:7777 -f

