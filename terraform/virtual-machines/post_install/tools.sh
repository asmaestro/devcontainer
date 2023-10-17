#!/bin/bash

# docker
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
sudo systemctl enable docker

# docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m) -o /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose

# kubectl
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# helm
sudo curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
sudo chmod 700 get_helm.sh
sudo ./get_helm.sh

# azc-cli
sudo curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

sudo sh -c "echo '  MaxSessions 1000' >> /etc/ssh/ssh_config"
sudo service ssh restart
