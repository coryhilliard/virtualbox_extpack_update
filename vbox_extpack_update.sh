#!/bin/bash
# Date:          May 17 2019
# Author:        Cory Hilliard
# License:       GPLv3
#
# Purpose:       This a bash script will automatically download the latest VirtualBox Guest Additions and 
#                Extension Pack and automatically install the Extension Pack after it finishes downloading
#
# Requirements:  
#                Must have already installed wget and VirtualBox
#                Must run this script in the folder you want to download the VBox packages into 
#                Must run this script with elevated privileges
#
# Usage:         wget https://gitlab.com/coryhilliard/virtualbox_extpack_update/raw/master/vbox_extpack_update.sh &&\
#                sudo bash ./vbox_extpack_update.sh

# Set the LatestVirtualBoxVersion variable to the latest version
LatestVirtualBoxVersion=$(wget -qO - http://download.virtualbox.org/virtualbox/LATEST.TXT)

# Print the lastest VirtualBox version we are using
echo " "
echo "The latest version of VirtualBox is ${LatestVirtualBoxVersion}"
echo " "

# Download Guest Additions
wget "http://download.virtualbox.org/virtualbox/${LatestVirtualBoxVersion}/VBoxGuestAdditions_${LatestVirtualBoxVersion}.iso"

# Download Extension Pack
wget "http://download.virtualbox.org/virtualbox/${LatestVirtualBoxVersion}/Oracle_VM_VirtualBox_Extension_Pack-${LatestVirtualBoxVersion}.vbox-extpack"

# Install Extension Pack
yes y | VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-${LatestVirtualBoxVersion}.vbox-extpack

# Print message to show script has completed
echo " "
echo "Script Complete"
echo " "

