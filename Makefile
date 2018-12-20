default: install-yaourt install-packages link-all set-shell

install-yaourt:
	./scripts/install-yaourt.sh
 
install-packages:
	yaourt -S --needed --noconfirm `cat packages-list.txt`
 
enable-services:
	# sudo systemctl enable lightdm NetworkManager tlp tlp-sleep
	# sudo systemctl disable systemd-rfkill
	# sudo tlp start

link-all: 
	./scripts/stow-core.sh
	./scripts/stow-config.sh

set-shell:
	chsh -s `which zsh` # `fish` is another alternative

sync-neovim:
	# ./configs/neovim/.config/nvim/sync.sh