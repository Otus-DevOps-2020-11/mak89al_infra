#!/bin/bash
apt-get install -y git
cd ~
sudo git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d
ps aux | grep puma
echo "app deployed"
