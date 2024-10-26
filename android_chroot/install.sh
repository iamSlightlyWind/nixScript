TERMUXHOME="/data/data/com.termux/files/home"
FILE="ArchLinuxARM-aarch64-latest.tar.gz"
CHROOTDIR="/data/local/tmp/chrootarch"

if [ ! -f "$FILE" ]; then
    wget http://os.archlinuxarm.org/os/$FILE
else
    echo "$FILE already exists."
fi

if [ -d "$CHROOTDIR" ]; then
    rm -rf "$CHROOTDIR"
fi

mkdir -p "$CHROOTDIR"
cd "$CHROOTDIR"

tar xvf /data/data/com.termux/files/home/$FILE --numeric-owner

mkdir media
mkdir media/sdcard
mkdir dev/shm

echo -e "nameserver 8.8.8.8\nnameserver 8.8.4.4" > etc/resolv.conf
echo "127.0.0.1 localhost" > etc/hosts