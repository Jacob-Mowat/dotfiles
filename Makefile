default: install-yaourt install-packages install-rofi link-all set-rofi-theme set-shell sync-neovim use-all-cores

install-yaourt:
	./scripts/install-yaourt.sh
 
install-packages:
	yaourt -S --needed --noconfirm `cat packages-list.txt`

install-rofi:
	./scripts/install-rofi.sh
 
enable-services:
	# sudo systemctl enable lightdm NetworkManager tlp tlp-sleep
	# sudo systemctl disable systemd-rfkill
	# sudo tlp start

link-all: 
	./scripts/stow-core.sh
	./scripts/stow-config.sh

set-rofi-theme:
	rofi-theme-selector -theme-str "@theme \"onedark\""

set-shell:
	chsh -s `which zsh` # `fish` is another alternative

sync-neovim:
	~/.config/nvim/sync.sh

use-all-cores:
	sudo sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j5"/g' /etc/makepkg.conf
	sudo sed -i 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T 4 -z -)/g' /etc/makepkg.conf
