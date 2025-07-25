#!/bin/bash

read -rsp "Sudo password: " PASS
sudo dnf install -y ansible
git clone https://github.com/davay/nobara-setup.git ~/Repos/nobara-setup
echo
(
    export ANSIBLE_BECOME_PASS="$PASS"
    ansible-playbook ./playbooks/init.yml
)
