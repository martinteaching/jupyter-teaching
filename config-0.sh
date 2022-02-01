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
sudo -H -u jupyter bash -c 'pip install --user jupyterlab'
sudo -H -u jupyter bash -c 'mkdir /home/jupyter/.jupyter'
sudo -H -u jupyter bash -c 'mkdir /home/jupyter/workspace'
# ---------------------------------------------- #
echo "=> installing utils..."
sudo apt -y install trash-cli
# ---------------------------------------------- #
