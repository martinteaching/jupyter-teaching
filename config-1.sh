# ---------------------------------------------- #
echo "=> setting up jupyter service..."
sudo systemctl enable jupyter.service
sudo systemctl daemon-reload
sudo systemctl restart jupyter.service
sudo systemctl status jupyter.service
# ---------------------------------------------- #
echo "=> installing proxy..."
sudo apt install -y nginx
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'
sudo ufw status
# ---------------------------------------------- #
echo "=> generating temporary self-signed cert..."
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj /C=GB/ST=London/L=London/O=martinchapman/CN=martinchapman.co.uk -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
# ---------------------------------------------- #
echo "=> setting up dh params..."
sudo openssl dhparam -dsaparam -out /etc/nginx/dhparam.pem 4096
# ---------------------------------------------- #
