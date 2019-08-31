#!/bin/sh -l

# 1 - ${{ inputs.key }}
# 2 - ${{ inputs.user }}
# 3 - ${{ inputs.hostname }}
# 4 - ${{ inputs.source }}
# 5 - ${{ inputs.destination }}

KEY=$1
USER=$2
HOST=$3
SOURCE=$4
DEST=$5
SSH_PATH=./.ssh

echo "transferring $SOURCE ➡ $DEST"

mkdir -p $SSH_PATH
touch "$SSH_PATH/known_hosts"  

echo "$KEY" > "$SSH_PATH/deploy_key"  

chmod 700 "$SSH_PATH"
chmod 600 "$SSH_PATH/known_hosts"
chmod 600 "$SSH_PATH/deploy_key"

scp -o StrictHostKeyChecking=no -i $SSH_PATH/deploy_key $SOURCE $USER@$HOST:$DEST