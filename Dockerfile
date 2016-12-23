FROM debian:latest

MAINTAINER HKLCF <hklcfs@gmail.com>

RUN apt-get update && apt-get upgrade && apt-get install -y \
  openssh-server \
  && rm -rf /var/lib/apt/lists/*

RUN echo 'root:password' | chpasswd

RUN mkdir /var/run/sshd

RUN sed 's/PermitRootLogin without-password/PermitRootLogin yes/' -i /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
