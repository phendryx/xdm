FROM phusion/baseimage:0.9.16
MAINTAINER Lonix <lonixx@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root
ENV TERM screen


#Applying stuff
RUN apt-get update -q && \
apt-get -yq install python git  && \
apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/*


#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run && chmod -v +x /etc/my_init.d/*.sh
#Adding abc user
RUN useradd -u 911 -U -s /bin/false abc && usermod -G users abc
# Use baseimage-docker's init system
CMD ["/sbin/my_init"]


# Volums and Ports
VOLUME /config
EXPOSE 8085