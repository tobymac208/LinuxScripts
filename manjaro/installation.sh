echo "I'm going to ping Google's DNS server to test your network connection. Press ENTER to do this."
read
ping 8.8.8.8 -c 4

echo ""
echo "Press ENTER to install all packages through pacman"
echo "Command: pacman -S steam wine ntfs-3g base-devel git chromium discord lutris gimp openshot neofetch bleachbit python-pip"
read
sudo pacman -S steam wine ntfs-3g base-devel git chromium discord lutris gimp openshot neofetch bleachbit python-pip audacity qbittorrent

echo ""
echo "Type in your username. MUST be your username!"
read username
echo "Is this your username -----> ${username} ? Press ENTER or Ctrl + C to quit."
read
# install yay
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R <${username}>:<${username}> ./yay-git
cd yay-git
makepkg si
# done

echo ""
echo "Press ENTER to install all packages with yay"
echo "Command: yay -S code etcher obs-studio openshot simplenote-electron-bin spotify"
read
yay -S code etcher obs-studio openshot simplenote-electron-bin spotify
