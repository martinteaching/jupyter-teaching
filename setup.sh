# ---------------------------------------------- #
export $(cat .env | xargs)
# ---------------------------------------------- #
ssh -o IdentitiesOnly=yes -i $SSH_KEY $SERVER_USER@$SERVER_ADDRESS < ./config-0.sh
# ---------------------------------------------- #
echo "=> copying jupyter notebook config..."
scp -o IdentitiesOnly=yes -i $SSH_KEY config/jupyter_notebook_config.py $SERVER_USER@$SERVER_ADDRESS:/home/ubuntu/jupyter_notebook_config.py
ssh -o IdentitiesOnly=yes -i $SSH_KEY $SERVER_USER@$SERVER_ADDRESS "sudo mv /home/ubuntu/jupyter_notebook_config.py /home/jupyter/.jupyter/jupyter_notebook_config.py"
ssh -o IdentitiesOnly=yes -i $SSH_KEY $SERVER_USER@$SERVER_ADDRESS "sudo chown jupyter:jupyter /home/jupyter/.jupyter/jupyter_notebook_config.py"
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
