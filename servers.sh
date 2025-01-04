#!/bin/bash

ansible-playbook ./playbooks/nginx.yml && \
ansible-playbook ./playbooks/containers.yml
