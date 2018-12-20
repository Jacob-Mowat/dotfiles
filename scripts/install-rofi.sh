#!/bin/zsh

# Clone the rofi repo
git clone https://github.com/DaveDavenport/rofi

# Move into the repo directory
cd rofi

# Update all submodules and initalize them
git submodule update --init

# run autoreconf and install them
autoreconf -i

# Make the build directory
mkdir build
cd build

# Configure the build
../configure

make

# Install rofi!
sudo make install

# Move out and Clean up
cd ../..
rm -rf rofi

# I am well aware that rofi can be installed via pacman, but this ensures the code is coming directly from the development source.