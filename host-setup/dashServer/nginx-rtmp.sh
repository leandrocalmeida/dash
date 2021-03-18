
cd /vagrant/host-setup/dashServer/
git clone https://github.com/ut0mt8/nginx-rtmp-module/
git clone https://github.com/nginx/nginx.git
cd nginx
./auto/configure --add-module=../nginx-rtmp-module
make
make install
wget https://isrv.pw/html5-live-streaming-with-mpeg-dash/nginx.service.txt -O /lib/systemd/system/nginx.service
systemctl daemon-reload
systemctl enable nginx.service