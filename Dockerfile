FROM fedora:latest

RUN dnf install -y samba

COPY smb.conf /etc/samba/smb.conf
COPY users.list /tmp
COPY scripts/users.sh /tmp
RUN chmod +x /tmp/users.sh

WORKDIR /tmp

RUN ./users.sh
RUN rm -f users.list users.sh

RUN mkdir -p /data/share
WORKDIR /data/share

CMD /bin/bash -c "smbd --foreground --log-stdout --no-process-group"
