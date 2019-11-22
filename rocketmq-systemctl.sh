#!/bin/bash
echo '
#!/bin/sh

#change current work directory to pwd
cd /disk1/rocketmq*/apache-rocketmq/bin/

#
# Name Server
#
#nohup sh mqnamesrv > ns.log 2>&1 &
./mqshutdown broker

sleep 3s

./mqshutdown namesrv
#
# Service Addr
#

echo "Stop Name Server and Broker Successfully, ${ADDR}"' > /disk1/rocketmq*/stopMQ2.sh

chmod +x /disk1/rocketmq*/s*
chmod +x /disk1/rocketmq*/apache-rocketmq/bin/mqshutdown


echo '
[Unit]
Description=rocketmq service
After=rocketmq.service

[Service]
Restart=always
Type=forking
User=root
Group=root
ExecStart=/bin/bash /disk1/rocketmq*/startMQ*.sh
ExecReload=/bin/bash /disk1/rocketmq*/stopMQ2.sh && /bin/bash /disk1/rocketmq*/startMQ*.sh
ExecStop=/bin/bash /disk1/rocketmq*/stopMQ2.sh
PrivateTmp=true

[Install]
WantedBy=multi-user.target' > /usr/lib/systemd/system/rocketmq.service

systemctl daemon-reload
systemctl enable rocketmq.service
systemctl restart rocketmq.service
