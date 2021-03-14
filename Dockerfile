FROM alpine

COPY /scripts/entrypoint.sh /entrypoint.sh
COPY /scripts/timestamp.sh /timestamp.sh
COPY /data/cron/crontabs/*.cron /var/spool/cron/crontabs

RUN mkdir -p /var/log/cron/ && \
    chmod -R 0644 /var/spool/cron/crontabs && \
    chmod +x  /timestamp.sh /entrypoint.sh

VOLUME ["/var/log/cron/"]

ENTRYPOINT ["/entrypoint.sh"]