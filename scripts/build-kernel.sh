#!/bin/bash

# Exit on error
set -e

repo=https://github.com/crashniels/linux.git
branch=ps4-linux-6.12.y
dir=/kernel/linux
git clone --recurse-submodules --branch "$branch" "$repo" "$dir"
cd "$dir"
cp config .config
mkdir -p lib/firmware/mrvl && cd lib/firmware/mrvl/ || exit
sudo wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/mrvl/sd8897_uapsta.bin
sudo wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/mrvl/sd8797_uapsta.bin
cd ../../..
# patch config file
sed -i 's,CONFIG_EXTRA_FIRMWARE_DIR="/lib/firmware",CONFIG_EXTRA_FIRMWARE_DIR="lib/firmware",g' .config
# Build the kernel
make -j$(nproc)
# Make bzImage
make bzImage
mkdir -p artifacts
cp arch/x86/boot/bzImage /kernel/linux/artifacts
echo "Kernel build completed successfully!"