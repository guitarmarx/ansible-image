#!/bin/sh

chmod -R  400 ~/.ssh/*

# clone repository
git clone -q $GIT_REPO ansible
cd ansible

# create vaultpass file
echo $VAULT_PASSWORD > vaultpass.txt

# run ansible
ansible-playbook -i $ENVIRONMENT --vault-password-file vaultpass.txt  playbook.yml --extra-vars "ansible_become_pass=$SUDO_PASSWORD"
