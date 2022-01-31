# ---------------------------------------------- #
export $(cat .env | xargs)
# ---------------------------------------------- #
echo "=> setting permissions to disable (some) user edit via file system..."
read -p "=> WARN: setting permissions in this way is experimental. Continue [N|y]? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # ---------------------------------------------- #
    echo "=> setting permissions for jupyter config folder..."
    ssh -o IdentitiesOnly=yes -i $SSH_KEY $SERVER_USER@$SERVER_ADDRESS "sudo chmod -R ugo-w /home/jupyter/.jupyter"
    ssh -o IdentitiesOnly=yes -i $SSH_KEY $SERVER_USER@$SERVER_ADDRESS "sudo chmod u+w /home/jupyter/.jupyter"
    ssh -o IdentitiesOnly=yes -i $SSH_KEY $SERVER_USER@$SERVER_ADDRESS "sudo chmod u+w /home/jupyter/.jupyter/lab"
    ssh -o IdentitiesOnly=yes -i $SSH_KEY $SERVER_USER@$SERVER_ADDRESS "sudo chmod -R u+w /home/jupyter/.jupyter/lab/workspaces"
    # ---------------------------------------------- #
    echo "=> setting permissions for jupyter share folder..."
    ssh -o IdentitiesOnly=yes -i $SSH_KEY $SERVER_USER@$SERVER_ADDRESS "sudo chmod -R ugo-w /home/jupyter/.local/share/jupyter"
    ssh -o IdentitiesOnly=yes -i $SSH_KEY $SERVER_USER@$SERVER_ADDRESS "sudo chmod u+w /home/jupyter/.local/share/jupyter"
    ssh -o IdentitiesOnly=yes -i $SSH_KEY $SERVER_USER@$SERVER_ADDRESS "sudo chmod -R u+w /home/jupyter/.local/share/jupyter/runtime"
    ssh -o IdentitiesOnly=yes -i $SSH_KEY $SERVER_USER@$SERVER_ADDRESS "sudo chmod u+w /home/jupyter/.local/share/jupyter/notebook_secret"
    ssh -o IdentitiesOnly=yes -i $SSH_KEY $SERVER_USER@$SERVER_ADDRESS "sudo chmod u+w /home/jupyter/.local/share/jupyter/nbsignatures.db"
    # ---------------------------------------------- #
    echo "=> setting permissions for jupyter etc folder..."
    ssh -o IdentitiesOnly=yes -i $SSH_KEY $SERVER_USER@$SERVER_ADDRESS "sudo chmod -R ugo-w /home/jupyter/.local/etc/jupyter"
    # ---------------------------------------------- #
fi
