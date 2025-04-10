# Docker Linux Kernel Builder

This repository provides a Dockerized environment for building the Linux kernel from the `ps4-linux-6.12.y` branch of [crashniels/linux](https://github.com/crashniels/linux) by default, but can be set to any branch in the build script.

## Prerequisites

- Docker installed on your system.
- Sufficient disk space and memory for kernel compilation.

## Steps to Build

1. Clone this repository:
   ```bash
   git clone https://github.com/FalsePhilosopher/ps4-linux-docker.git
   cd ps4-linux-docker
   ```

2. Build the Docker image:
   ```bash
   docker build -t ps4-linux-docker .
   ```

3. Run the Docker container and mount the required configuration:
   ```bash
   docker run --rm -it \
       -v "$(pwd)/config:/kernel/linux/config" \
       ps4-linux-docker
   ```

4. The kernel and modules will be built inside the Docker container.

## Troubleshooting

If you encounter issues, ensure that:
- Your Docker installation has enough resources allocated.