FROM centos

COPY /kubernetes.repo /etc/yum.repos.d/
RUN yum install kubectl -y
RUN yum install sudo -y
RUN yum install java -y
RUN yum install git -y
RUN yum install openssh-server -y
COPY ca.crt /root/
COPY client.crt /root/
COPY client.key /root/
COPY config /root/.kube/
RUN ssh-keygen -A
CMD ["/usr/sbin/sshd", "-D"] && /bin/bash

