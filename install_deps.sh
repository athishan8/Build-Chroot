apt update -y
apt install -f -y
apt -y install nano wget git xz-utils build-essential ccache autoconf || exit 1
apt -y build-dep wine || exit 1
apt -y install gcc-10-multilib-x86-64-linux-gnu g++-10-multilib-x86-64-linux-gnu || exit 1
apt -y install gcc-mingw-w64 g++-mingw-w64 || exit 1
apt -y install libgstreamer1.0-dev:amd64 libgstreamer-plugins-base1.0-dev:amd64 libsdl2-dev:amd64 libudev-dev:amd64 libosmesa6-dev:amd64 libvulkan-dev:amd64 libcapi20-dev:amd64 libcups2-dev:amd64 libgphoto2-dev:amd64 libsane-dev:amd64 libkrb5-dev:amd64 samba-dev:amd64 libpcap-dev:amd64 libusb-1.0-0-dev:amd64 libv4l-dev:amd64 libxxf86vm-dev:amd64 libxinerama-dev:amd64 libasound2-dev:amd64 libpulse-dev:amd64 libdbus-1-dev:amd64 libfontconfig-dev:amd64 libfreetype-dev:amd64 libgnutls28-dev:amd64 libgl-dev:amd64 libunwind-dev:amd64 libx11-dev:amd64 libxcomposite-dev:amd64 libxcursor-dev:amd64 libxfixes-dev:amd64 libxi-dev:amd64 libxrandr-dev:amd64 libxrender-dev:amd64 libxext-dev:amd64 ocl-icd-opencl-dev:amd64 ocl-icd-dev:amd64 || exit 1
echo "Done"
