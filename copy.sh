# ---------------------------------------------- #
export $(cat .env | xargs)
# ---------------------------------------------- #
scp -o IdentitiesOnly=yes -i $SSH_KEY config/$1 $SERVER_USER@$SERVER_ADDRESS:/home/ubuntu/$1
ssh -o IdentitiesOnly=yes -i $SSH_KEY $SERVER_USER@$SERVER_ADDRESS "sudo mkdir -p "$2
ssh -o IdentitiesOnly=yes -i $SSH_KEY $SERVER_USER@$SERVER_ADDRESS "sudo mv /home/ubuntu/"$1 " "$2"/"$1
ssh -o IdentitiesOnly=yes -i $SSH_KEY $SERVER_USER@$SERVER_ADDRESS "sudo chown root:root " $2"/"$1
# ---------------------------------------------- #
