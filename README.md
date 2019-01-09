1. Install Ansible and Git.

        brew install ansible git

2. Clone the repo (to, e.g., `~/Development`).

        mkdir ~/Development && cd ~/Development
        git clone git@github.com:trdarr/dotfiles.git

     or

        mkdir ~/Development && cd ~/Development
        git clone https://github.com/trdarr/dotfiles.git

3. Run the playbook.

        cd ~/Development/dotfiles/ansible
        ansible-playbook playbook.yaml
