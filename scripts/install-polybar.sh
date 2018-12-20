#!/bin/zsh

# Enable command full-tracing(x) and error handling(e)
set -xe

# Make sure `git` is instald
sudo pacman -Sy git

# Make temporary directory
mkdir temp-polybar
cd temp-polybar

# Clone the repo
git clone --branch 3.2 --recursive https://github.com/jaagr/polybar

# Move into the repo
cd polybar

# Execute the build helper script
./build.sh --all-features