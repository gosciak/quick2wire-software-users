#!/bin/sh
set -e

# Ensure GPG is initialised for the current user.  If it is not, apt-key fails!
gpg --list-keys > /dev/null

sudo mkdir -p /etc/apt/sources.list.d/
sudo cat > /etc/apt/sources.list.d/quick2wire.list  <<EOF
# Quick2Wire Software
deb http://dist.quick2wire.com/raspbian wheezy main 
deb-src http://dist.quick2wire.com/raspbian wheezy main
EOF

# Install the Quick2Wire key for authenticating software packages
curl -s http://dist.quick2wire.com/software@quick2wire.com.gpg.key | sudo apt-key add -

sudo apt-get update

echo "You can now install Quick2Wire software packages with the apt-get command"
echo "For example: sudo apt-get install quick2wire-gpio-admin"
