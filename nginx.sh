echo '
[Unit]
Description=nginx service
After=nginx.service

[Service]
Restart=always
Type=forking
User=root
Group=root
PIDFile=/var/run/nginx.pid
ExecStartPre=/usr/local/nginx/sbin/nginx -t -c /etc/nginx/nginx.conf 
ExecStart=/usr/local/nginx/sbin/nginx
ExecReload=nginx -s reload
ExecStop=/usr/local/nginx/sbin/nginx -s stop
PrivateTmp=true

[Install]
WantedBy=multi-user.target' > /usr/lib/systemd/system/nginx.service

systemctl daemon-reload
systemctl enable nginx.service
systemctl restart nginx.service

