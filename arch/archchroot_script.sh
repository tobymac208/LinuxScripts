pacman -Syu
# I'm using gnome because I've found it be more stable than KDE plasma,
pacman -S sudo networkmanager xorg lightdm lightdm-gtk-greeter cinnamon gnome-terminal pulseaudio pulseaudio-alsa pavucontrol firefox vlc gimp xfburn thunderbird gedit gnome-system-monitor faenza-icon-theme

# set local time
ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime

# set system clock
hwclock --systohc

# generate locale
cd /etc
echo "en_US.UTF-8 UTF-8" >> locale.gen
locale-gen

# set language
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

# get and set the computer's name
echo "Please enter the computer's name: "
read hostname
echo "$hostname" >> /etc/hostname

# get and set root password
echo "What's your desired root password? "
read password
passwd
echo "$password"
echo "$password"

# create a new user with homedir
echo "Enter desired name for new user: "
read username
useradd -m $username
echo "What's your password? "
read user_password
passwd $username
echo "$user_password"
echo "$user_password"
usermod -aG wheel,optical,storage,video $username
# add wheel to sudoers
echo "%wheel    ALL=(ALL) ALL" >> /etc/sudoers

# enable network manager
sysemctl enable NetworkManager
systemctl enable lightdm

# configure grub
mkdir /boot/EFI
mount "/dev/$device_name" + "1"
grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# exit arch-chroot
exit
