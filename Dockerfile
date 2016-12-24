FROM debian:latest

MAINTAINER HKLCF <hklcfs@gmail.com>

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
  openssh-server \
  && yum clean all && rm -rf /var/lib/apt/lists/*

RUN echo 'root:password' | chpasswd

RUN mkdir /var/run/sshd

RUN sed 's/#PermitRootLogin yes/PermitRootLogin yes/' -i /etc/ssh/sshd_config

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
