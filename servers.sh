#!/bin/bash

ansible-playbook ./playbooks/containers.yml --ask-become-pass && \
ansible-playbook ./playbooks/nginx.yml --ask-become-pass && \
ansible-playbook ./playbooks/github.yml 
