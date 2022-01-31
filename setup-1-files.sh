# ---------------------------------------------- #
export $(cat .env | xargs)
# ---------------------------------------------- #
echo "=> setting permissions to disable (some) user edits via file system..."
read -p "=> WARN: setting permissions in this way is experimental. Continue [N|y]? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # ---------------------------------------------- #
    echo "=> setting general permissions (NB. these can be changed by user, so just a precaution against accidental changes)..."
    ssh -o IdentitiesOnly=yes -i $SSH_KEY $SERVER_USER@$SERVER_ADDRESS "sudo chmod ugo-w /home/jupyter/.bashrc"
    ssh -o IdentitiesOnly=yes -i $SSH_KEY $SERVER_USER@$SERVER_ADDRESS "sudo chmod ugo-w /home/jupyter/.profile"
    # ---------------------------------------------- #
fi
