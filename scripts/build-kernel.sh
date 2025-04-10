#!/bin/bash

# Exit on error
set -e

repo=https://github.com/crashniels/linux.git
branch=ps4-linux-6.12.y
dir=/kernel/linux
config=/kernel/linux/config

# Clone the kernel source if not already cloned
if [ ! -d "$dir" ]; then
    git clone --recurse-submodules --branch "$branch" "$repo" "$dir"
fi
cd "$dir"
# Clean previous builds
make mrproper
# Copy custom config
cp "$config" .config
# Build the kernel
make -j$(nproc)
# Make bzImage
make bzImage
# Install the kernel modules
make modules_install
echo "Kernel build completed successfully!"