Docker rbenv-enabled image

- Built on top of phusion/baseimage:0.9.10
- Supports multiple daemon
- This image sets up a user `apps`
- its home is in /home/apps
- root can log in using its ssh key.

If you want to change the SSH, you can either create a derived Dockerfile to install your own key:

```
FROM octplane/rbenv
ADD ssh/authorized_keys /tmp/your_key
RUN cat /tmp/your_key >> /root/.ssh/authorized_keys && rm -f /tmp/your_key
```

Or fork this repository, and do whatever you want.

This image is also on docker hub, you can get it :

```
docker pull octplane/rbenv
# docker run -P -d ce59c644822b
```

## Changelog

- v1.0.2: removed some unecessary packages at that point.
