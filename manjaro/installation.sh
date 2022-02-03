echo ""
echo "Press ENTER to install all packages through pacman"
echo "Command: pacman -S steam wine ntfs-3g base-devel git chromium discord lutris gimp openshot neofetch cmatrix bleachbit python-pip audacity npm"
read
sudo pacman -S steam wine ntfs-3g base-devel git chromium discord lutris gimp openshot neofetch cmatrix bleachbit python-pip audacity go npm traceroute

echo ""
echo "Type in your username. MUST be your username!"
read username
echo "Is this your username -----> ${username} ? Press ENTER or Ctrl + C to quit."
read

# install yay
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R ${username}:${username} ./yay-git
cd yay-git
makepkg -si
# done

echo ""
echo "Press ENTER to install all packages with yay"
echo "Command: yay -S code etcher obs-studio openshot simplenote-electron-bin spotify"
yay -S code etcher obs-studio openshot simplenote-electron-bin spotify gnome-books nmap

echo ""
echo "Generate ssh key."
read
ssh-keygen -b 4096
