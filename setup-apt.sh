#!/bin/sh
set -e

# Note: this MUST be an HTTPS URL to ensure that the correct configuration is installed
BASEURL=https://raw.github.com/quick2wire/quick2wire-software-users/master

# Ensure GPG is initialised for the current user.  If it is not, apt-key fails!
gpg --list-keys > /dev/null

# Install the Quick2Wire key for authenticating software packages
curl -s $BASEURL/software@quick2wire.com.gpg.key | (sudo apt-key add -)

# Configure the package manager with the location of the Quick2Wire repository
sudo mkdir -p /etc/apt/sources.list.d/
curl -s $BASEURL/quick2wire.list | (sudo cat > /etc/apt/sources.list.d/quick2wire.list)

# Refresh the list of available packages
sudo apt-get update

echo "You can now install Quick2Wire software packages with the apt-get command"
echo "For example: sudo apt-get install quick2wire-gpio-admin"
