# ---------------------------------------------- #
echo "=> adding jupyter user..."
chmod -R go-rwx /home/ubuntu/
sudo adduser --disabled-password --gecos "" jupyter
# ---------------------------------------------- #
echo "=> updating..."
sudo apt update
sudo apt -y upgrade
# ---------------------------------------------- #
echo "=> installing pip..."
sudo apt -y install python3-pip
# ---------------------------------------------- #
echo "=> installing jupyter..."
# Installing things with pip as root is bad, but provides us with some security here.
sudo pip install jupyterlab
sudo -H -u jupyter bash -c 'mkdir /home/jupyter/workspace'
# ---------------------------------------------- #
echo "=> installing utils..."
sudo apt -y install trash-cli
# ---------------------------------------------- #
