#!/bin/bash

set -e  # Exit on any error

FREETUBE_BIN="/usr/bin/freetube"
FREETUBE_SANDBOX="/opt/FreeTube/chrome-sandbox"
APPARMOR_PROFILE="/etc/apparmor.d/freetube"

# Create an AppArmor profile for FreeTube
echo "Creating AppArmor profile for FreeTube..."
sudo cp /etc/apparmor.d/chrome "$APPARMOR_PROFILE"
sudo sed -i "s|/opt/google/chrome/chrome|$FREETUBE_BIN|g" "$APPARMOR_PROFILE"
sudo sed -i 's/chrome/freetube/g' "$APPARMOR_PROFILE"
#sudo sed -i 's/abi\/4.0/abi\/4.0.1/g' "$APPARMOR_PROFILE"

# Create an AppArmor profile for FreeTube's sandbox
#echo "Creating AppArmor profile for FreeTube sandbox..."
#sudo cp /etc/apparmor.d/chrome "$FREETUBE_SANDBOX"
#sudo sed -i "s|/opt/google/chrome/chrome|$FREETUBE_BIN|g" "$FREETUBE_SANDBOX"
#sudo sed -i 's/chrome/freetube/g' "$FREETUBE_SANDBOX"
#sudo sed -i 's/abi\/4.0/abi\/4.0.1/g' "$FREETUBE_SANDBOX"

# Restart AppArmor service
sudo systemctl restart apparmor.service

# Fix sandbox permissions
sudo chmod 4755 "$FREETUBE_SANDBOX"

echo "FreeTube installation and AppArmor configuration complete!"

