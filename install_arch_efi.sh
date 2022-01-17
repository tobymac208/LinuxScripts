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
mkfs.fat -F32 "/dev/$device_name""1"
mkfs.swap "/dev/$device_name""2"
swapon "/dev/$device_name""2"
mkfs.ext4 "/dev/$device_name""3"

# mount partitions
mkdir /mnt/boot
mount "/dev/$device_name""3" /mnt
mount "/dev/$device_name""1" /mnt/boot

# install base system
pacstrap /mnt base linux linux-firmware base-devel git grub

# create fstab
genfstab -U /mnt >> /mnt/etc/fstab

# enter fake root and update syste. run the accompanying script
arch-chroot /mnt ./archchroot_script.sh

# lazy unmount of drives
umount -l /mnt/boot
umount -l /mnt

# reboot the system
reboot
