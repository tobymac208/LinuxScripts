echo "Press ENTER to install all packages through pacman"
echo "Command: pacman -S steam wine ntfs-3g base-devel git chromium discord lutris spotify camera gimp python3-pip openshot neofetch bleachbit"
read
sudo pacman -S steam wine ntfs-3g base-devel git chromium discord lutris spotify camera gimp python3-pip openshot neofetch bleachbit

echo "Type in your username. MUST be your username!"
read username
echo "Is this your username -----> ${username} ?"
# install yay
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R <"$username">:<"$username"> ./yay-git
cd yay-git
makepkg si
# done

echo "Press ENTER to install all packages with yay"
echo "Command: yay -S code etcher obs-studio openshot simplenote-electron-bin"
read
yay -S code etcher obs-studio openshot simplenote-electron-bin

