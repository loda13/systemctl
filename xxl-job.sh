#!/bin/bash

chmod +x /disk1/xxl-job/s*

echo '
[Unit]
Description=xxl-job service
After=xxl-job.service

[Service]
Restart=always
Type=forking
User=root
Group=root
ExecStart=/bin/bash /disk1/xxl-job/start.sh
ExecReload=/bin/bash /disk1/xxl-job/stop.sh && /bin/bash /disk1/xxl-job/start.sh
ExecStop=/bin/bash /disk1/xxl-job/stop.sh
PrivateTmp=true

[Install]
WantedBy=multi-user.target' > /usr/lib/systemd/system/xxl-job.service

systemctl daemon-reload
systemctl enable xxl-job.service
systemctl restart xxl-job.service
