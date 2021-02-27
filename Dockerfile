FROM centos:latest

ENV VER=0.17.0

RUN yum install -y epel-release https://github.com/vmware-tanzu/octant/releases/download/v0.17.0/octant_0.17.0_Linux-64bit.rpm
RUN yum install -y awscli

RUN mkdir -p /usr/local/bin
RUN cd /usr/local/bin && ln -s /usr/bin/aws

VOLUME /root/.kube
VOLUME /root/.aws

EXPOSE 7777

CMD ["/usr/local/bin/octant", \
     "--listener-addr=0.0.0.0:7777", \
     "--disable-open-browser"]
