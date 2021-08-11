#!/bin/bash

# flash
sudo rpm -ivh http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux

# google
sudo sh -c 'echo -e "[google-chrome]\nname=google-chrome - 64-bit\nbaseurl=http://dl.google.com/linux/chrome/rpm/stable/i386\nenabled=1\ngpgcheck=1\ngpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub" >> /etc/yum.repos.d/google-chrome.repo'


