# Use phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.
FROM phusion/baseimage:0.9.10
MAINTAINER Pierre Baillet <pierre@baillet.name>

# Set correct environment variables.
ENV HOME /home/apps

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ADD ssh/authorized_keys /tmp/your_key
RUN cat /tmp/your_key >> /root/.ssh/authorized_keys && rm -f /tmp/your_key

# Common
RUN mkdir -p $HOME
RUN chown 1000:1000 $HOME

RUN addgroup --gid 1000 apps
RUN adduser --disabled-password --home=/home/apps --gecos "" --uid 1000 --gid 1000 apps
RUN apt-get update
