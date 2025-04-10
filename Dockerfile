# Base image with essential build tools
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libncurses-dev \
    bison \
    flex \
    libssl-dev \
    libelf-dev \
    clang \
    llvm \
    pahole \
    rustc \
    git \
    wget \
    curl \
    bc \
    dwarves \
    kmod \
    && apt-get clean

# Set working directory
WORKDIR /kernel

# Copy scripts for building and managing the kernel
COPY scripts/ /usr/local/bin/

# Make scripts executable
RUN chmod +x /usr/local/bin/*.sh

# Build kernel
CMD ["/usr/local/bin/build-kernel.sh"]