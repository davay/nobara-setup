#!/bin/bash

ansible-playbook ./playbooks/nginx.yml --ask-become-pass && \
ansible-playbook ./playbooks/containers.yml
