# ---------------------------------------------- #
export $(cat .env | xargs)
# ---------------------------------------------- #
ssh -o IdentitiesOnly=yes -i $SSH_KEY $SERVER_USER@$SERVER_ADDRESS < ./config-0.sh
# ---------------------------------------------- #
echo "=> copying jupyter notebook config..."
./copy.sh "jupyter_notebook_config.py" "/home/jupyter/.jupyter"
./copy.sh "overrides.json" "/home/jupyter/.local/share/jupyter/lab/settings"
./copy.sh "page_config.json" "/home/jupyter/.local/etc/jupyter/labconfig"
# ---------------------------------------------- #
echo "=> copying jupyter service config..."
scp -o IdentitiesOnly=yes -i $SSH_KEY config/jupyter.service $SERVER_USER@$SERVER_ADDRESS:/home/ubuntu/jupyter.service
ssh -o IdentitiesOnly=yes -i $SSH_KEY $SERVER_USER@$SERVER_ADDRESS "sudo mv /home/ubuntu/jupyter.service /etc/systemd/system/jupyter.service"
# ---------------------------------------------- #
ssh -o IdentitiesOnly=yes -i $SSH_KEY $SERVER_USER@$SERVER_ADDRESS < ./config-1.sh
# ---------------------------------------------- #
echo "=> copying proxy config..." 
scp -o IdentitiesOnly=yes -i $SSH_KEY config/martinteaching.xyz $SERVER_USER@$SERVER_ADDRESS:/home/ubuntu/martinteaching.xyz
ssh -o IdentitiesOnly=yes -i $SSH_KEY $SERVER_USER@$SERVER_ADDRESS "sudo mv /home/ubuntu/martinteaching.xyz /etc/nginx/sites-available/martinteaching.xyz"
# ---------------------------------------------- #
ssh -o IdentitiesOnly=yes -i $SSH_KEY $SERVER_USER@$SERVER_ADDRESS < ./config-2.sh
# ---------------------------------------------- #
./setup-1-files.sh
# ---------------------------------------------- #
