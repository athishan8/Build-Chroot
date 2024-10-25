#!/bin/bash
cd ~/
pkg install wget tsu -y

export ROOTFS_DIR="${HOME}"/ubuntu-noble-arm64-2

if [ -e "$ROOTFS_DIR" ]; then
    echo "$ROOTFS_DIR already exists, delete it first."
    echo "If you want to delete rootfs directory, do it ONLY after rebooting the device"
    echo "如果要删除 rootfs 目录，请仅在重启设备后执行此操作"
    exit
fi
wget -q --show-progress https://github.com/athishan8/Build-Chroot/releases/download/24.04/rootfs3.tar.xz || exit 1
sudo tar -xf rootfs3.tar.xz

echo "
#!/bin/bash

export ROOTFS_DIR=\"$ROOTFS_DIR\"

if [ ! -z \"\$1\" ]; then
    export ROOTFS_DIR=\"\$1\"
fi

mkdir -p \"\$ROOTFS_DIR/sdcard\"
mkdir -p \"\$ROOTFS_DIR/data\"

unset LD_PRELOAD

function do-chroot {
        mount --bind /dev $ROOTFS_DIR/dev
        mount sys -t sysfs $ROOTFS_DIR/sys
        mount proc -t proc $ROOTFS_DIR/proc
        mount --bind /storage/emulated/0/ $ROOTFS_DIR/sdcard
	mount --bind /data $ROOTFS_DIR/data

        chroot $ROOTFS_DIR /usr/bin/su - root

        umount⠀$ROOTFS_DIR/dev &> /dev/null
        umount⠀$ROOTFS_DIR/proc &> /dev/null
        umount⠀$ROOTFS_DIR/sdcard &> /dev/null
        umount⠀$ROOTFS_DIR/sys &> /dev/null
	umount⠀$ROOTFS_DIR/data &> /dev/null
        echo "If you want to delete rootfs directory, do it ONLY after rebooting the device"
        echo "如果要删除 rootfs 目录，请仅在重启设备后执行此操作"
}

su -c \"\$(declare -f do-chroot); do-chroot\"
">~/login-chroot-arm64-2.sh
chmod +x ~/login-chroot-arm64-2.sh
rm rootfs3.tar.xz
~/login-chroot-arm64-2.sh || exit 1
