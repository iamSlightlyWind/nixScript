sudo chmod 777 *.sh

su -c "rm /data/local/tmp/*.sh"

sudo cp -fp mount.sh /data/local/tmp
sudo cp -fp umount.sh /data/local/tmp
sudo cp -fp start_chroot.sh /data/local/tmp
sudo cp -fp start_de.sh /data/local/tmp

sudo cp -fp chroot.sh /data/data/com.termux/files/home
sudo cp -fp de.sh /data/data/com.termux/files/home
sudo cp -fp kill.sh /data/data/com.termux/files/home
sudo cp -fp both.sh /data/data/com.termux/files/home
sudo cp -fp install.sh /data/data/com.termux/files/home