sudo dnf install -y ansible
git clone https://github.com/davay/nobara-setup.git ~/Repos/nobara-setup
ansible-playbook ./playbooks/packages.yml