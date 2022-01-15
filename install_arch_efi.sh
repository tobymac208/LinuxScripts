# verify the user it connected to the internet
ping archlinux.org
echo "Ping complete."

# configure time
timedatectl set-ntp true

# get the device's name
echo "Enter the device name (e.g., sda, sdc, sdb)"
read device_name
echo "You entered $device_name. Is this correct? y/n"
read answer
if [$answer != "y"];
then
  exit
fi

# make the user format the disk
cfdisk /dev/$device_name

# format disks and create filesystems
mkfs.fat -F32 "/dev/$device_name" + "1"
mkfs.swap "/dev/$device_name" + "2"
swapon "/dev/$device_name" + "2"
mkfs.ext4 "/dev/$device_name" + "3"

# mount partitions
mkdir /mnt/boot
mount "/dev/$device_name" + "3" /mnt
mount "/dev/$device_name" + "1" /mnt/boot

# install base system
pacstrap /mnt base linux linux-firmware base-devel git grub

# create fstab
genfstab -U /mnt >> /mnt/etc/fstab

# enter fake root and update system
arch-chroot /mnt /bin/bash
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

# reboot the system
reboot
