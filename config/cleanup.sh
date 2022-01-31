sudo -H -u jupyter bash -c 'trash-empty'
sudo -H -u jupyter bash -c 'cat /dev/null > ~/.bash_history && history -c'
sudo -H -u jupyter bash -c 'rm /home/jupyter/.viminfo*'
sudo -H -u jupyter bash -c 'rm /home/jupyter/.node_repl_history'
