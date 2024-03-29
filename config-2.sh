# ---------------------------------------------- #
echo "=> setting up proxy..."
sudo ln -s /etc/nginx/sites-available/martinteaching.xyz /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
# ---------------------------------------------- #
echo "=> configuring for development..."
sudo -H -u jupyter bash -c "echo 'alias python=python3' >> /home/jupyter/.bashrc"
sudo -H -u jupyter bash -c "git config --global user.email 'jupyter@sustainability'"
sudo -H -u jupyter bash -c "git config --global user.name 'Jupyter Sustainability'"
# ---------------------------------------------- #
echo "=> installing development dependencies..."
# ---------------------------------------------- #
echo "=> installing node..."
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs
# ---------------------------------------------- #
echo "=> installing docker..."
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get -y install ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker ubuntu
sudo usermod -aG docker jupyter
sudo su ubuntu
docker run hello-world
# prompt jupyter docker permission update
sudo systemctl restart jupyter
# ---------------------------------------------- #
echo "=> pulling required Docker images..."
sudo -H -u jupyter bash -c "docker pull python:3"
# ---------------------------------------------- #
echo "=> installing docker compose..."
sudo apt -y install docker-compose
# ---------------------------------------------- #
