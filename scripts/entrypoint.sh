#!/bin/sh
echo "Docker running..."

ls /var/spool/cron/crontabs/

# cat /var/spool/cron/crontabs/*.cron | crontab - && crond -f -L /dev/stdout
cat /var/spool/cron/crontabs/*.cron | crontab - && crond -b -L /var/log/cron/cron.log

echo "Press CTRL-C to exit"
while [ true ] ; do
read -t 3 -n 1
if [ $? = 0 ] ; then
exit ;
fi
done