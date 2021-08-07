#!/bin/bash

# update all packages and then install the ones we want
sudo yum update && sudo yum install vim timeshift grub-customizer gparted deja-dup ntfs-3g
# now we want to install packages we can only get through snap. We'll first need snap. The second part enables classic snap support
sudo dnf install snapd gnome-tweak-tool wget && sudo ln -s /var/lib/snapd/snap /snap
# now we'll install those applications
sudo snap install --classic code
# FILES & FOLDERS
mkdir ~/source && mkdir ~/source/repos && mkdir ~/.themes
# install Nordic GTK 3/4 theme -- change directory and download the file to Downloads
cd ~/Downloads
wget https://dl3.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2Mjc3NjM2NTUiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6ImJkOTY1N2ViYjQyYTE1ZGIzZTVhOWMxYmUxYmRmNmM1MzdkY2JmY2UzYTU1ZDg1N2U0MDcxMDA4MDBjNDY0MTY5MjcwYTg4MjUzMGQzNzMzMjRkNGM5YzliMTRlOWE5MjVhZGY0MDFjMzA4ZTA5NzRkYTg0YzNkODRjZTYwMmZmIiwidCI6MTYyODM1MjQxOCwic3RmcCI6IjNlYzdkNjBjNWYwYmYxMjIwY2YzZjU5ODA0YmRmMjYxIiwic3RpcCI6Ijc1LjczLjIwNC4yMDUifQ.hSPWJN6-3_QcM4La2KIBs-QwOnGG9SdtBOWHA9HVrig/Nordic.tar.xz

# BACKUPs / TIMESHIFT
sudo timeshift --create