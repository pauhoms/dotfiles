#!/bin/bash

# flash
sudo rpm -ivh http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux

# google
sudo dnf install fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome

