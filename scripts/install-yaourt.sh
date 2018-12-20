#!/usr/bin/env bash

# Enable command full-tracing(x) and error handling(e)
set -xe

# Make sure `git` is installed
sudo pacman -Sy git

# Make directory for the `package-query` repo and the `yaourt` repo.
mkdir -p temp-yaourt-repos
cd temp-yaourt-repos

# CLone the `package-query` repo
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..

# Clone the `yaourt` repo
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ../..

# Remove the temporary directory containing the repos
rm -rf temp-yaourt-repos