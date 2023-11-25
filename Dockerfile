FROM quay.io/centos/centos:stream9 

RUN yum -y update
RUN yum install -y bind iputils nmap-ncat
RUN /usr/sbin/rndc-confgen -a -b 512 -k rndc-key
RUN chmod 755 /etc/rndc.key
RUN chmod g+w /etc/named

EXPOSE 53/UDP
EXPOSE 53/TCP

COPY named.conf /etc/bind/
COPY example.com /etc/bind/master/
COPY 192.168.1.rev /etc/bind/master/

CMD ["/usr/sbin/named", "-d", "9", "-c", "/etc/bind/named.conf", "-g", "-u", "named"]
#CMD ["/usr/sbin/named", "-c", "/etc/bind/named.conf", "-g", "-u", "named"]
