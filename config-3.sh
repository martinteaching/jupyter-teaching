# ---------------------------------------------- #
echo "=> installing and running certbot..."
sudo apt install -y certbot python3-certbot-nginx
sudo certbot -n -m martin.chapman@kcl.ac.uk --agree-tos --test-cert --nginx -d martinteaching.xyz -d www.martinteaching.xyz
sudo systemctl restart nginx
# ---------------------------------------------- #
