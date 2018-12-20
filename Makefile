default: install-yaourt install-packages enable-services link-config set-shell sync-neovim

install-yaourt:
	./scripts/install-yaourt.sh
 
install-packages:
	yaourt -S --needed --noconfirm `cat packages-list.txt`
 
enable-services:
	sudo systemctl enable lightdm NetworkManager tlp tlp-sleep
	sudo systemctl disable systemd-rfkill
	sudo tlp start

link-config: 
	stow --restow `ls -d ./configs/*/`

set-shell:
	chsh -s `which fish` # might change this too zsh, if I see the reason too.

sync-neovim:
	./configs/neovim/.config/nvim/sync.sh