#!/bin/bash

sudo dnf install -y ansible ; \
git clone https://github.com/davay/nobara-setup.git ~/Repos/nobara-setup ; \
ansible-playbook ./playbooks/init.yml --ask-become-pass && \
ansible-playbook ./playbooks/dotfiles.yml --ask-become-pass && \
ansible-playbook ./playbooks/firewalld.yml --ask-become-pass
