#!/bin/sh
set -e

function listfile() {
cat <<EOF
# Quick2Wire Software
deb http://dist.quick2wire.com/raspbian wheezy main 
deb-src http://dist.quick2wire.com/raspbian wheezy main
EOF
}

# Ensure GPG is initialised for the current user.  If it is not, apt-key fails!
gpg --list-keys > /dev/null

# Install the Quick2Wire key for authenticating software packages
curl -s http://dist.quick2wire.com/software@quick2wire.com.gpg.key | sudo apt-key add -

# Configure the package manager with the location of the Quick2Wire repository
sudo mkdir -p /etc/apt/sources.list.d/
listfile | sudo cat > /etc/apt/sources.list.d/quick2wire.list
sudo apt-get update

echo "You can now install Quick2Wire software packages with the apt-get command"
echo "For example: sudo apt-get install quick2wire-gpio-admin"
