!/bin/bash
apt install haveged hexedit curl sudo apt-transport-https lsb-release ca-certificates curl gnupg -y
curl https://mirror-cdn.xtom.com/sb/nginx/public.key | apt-key add -
echo "deb https://mirror-cdn.xtom.com/sb/nginx/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/sb-nginx.list
apt update
apt install nginx-extras -y
