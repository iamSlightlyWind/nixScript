sudo chmod 777 *.sh

su -c "rm /data/local/tmp/chroot.sh"
su -c "rm /data/local/tmp/mount.sh"
su -c "rm /data/local/tmp/start_de.sh"
su -c "rm /data/local/tmp/umount.sh"

sudo rm ../../chroot.sh
sudo rm ../../de.sh
sudo rm ../../kill.sh

mv /data/local/tmp/de.sh ../../
mv /data/local/tmp/chroot.sh ../../
mv /data/local/tmp/kill.sh ../../

sudo cp *.sh /data/local/tmp