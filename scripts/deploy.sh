#!/bin/bash
sudo apt-get update
sleep 30
echo "updated"
sudo apt-get install -y git
echo "git installed"
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
sleep 30
puma -d
ps aux | grep puma
echo "app deployed"
