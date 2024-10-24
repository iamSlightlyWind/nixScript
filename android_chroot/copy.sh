su -c "rm /data/local/tmp/chroot.sh"
su -c "rm /data/local/tmp/mount.sh"
su -c "rm /data/local/tmp/start_de.sh"
su -c "rm /data/local/tmp/umount.sh"
sudo rm ../../start.sh

sudo cp *.sh /data/local/tmp
sudo mv /data/local/tmp/start.sh ../../