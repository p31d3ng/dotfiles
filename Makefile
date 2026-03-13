.PHONY: install install-tmux install-alacritty install-fonts

install: install-tmux install-alacritty

install-fonts:
	@echo "Install MesloLGS NF fonts to ~/Library/Fonts? [y/N]"; \
	read ans; \
	if [ "$$ans" != "y" ] && [ "$$ans" != "Y" ]; then \
		echo "Skipping fonts"; \
		exit 0; \
	fi; \
	cp fonts/*.ttf ~/Library/Fonts/; \
	echo "Installed MesloLGS NF fonts -> ~/Library/Fonts/"

install-tmux:
	@if [ -f ~/.tmux.conf ]; then \
		echo "~/.tmux.conf already exists. Overwrite? [y/N]"; \
		read ans; \
		if [ "$$ans" != "y" ] && [ "$$ans" != "Y" ]; then \
			echo "Skipping tmux.conf"; \
			exit 0; \
		fi; \
	fi
	cp tmux.conf ~/.tmux.conf
	@echo "Installed tmux.conf -> ~/.tmux.conf"

install-alacritty: install-fonts
	@mkdir -p ~/.config/alacritty
	@if [ -f ~/.config/alacritty/alacritty.toml ]; then \
		echo "~/.config/alacritty/alacritty.toml already exists. Overwrite? [y/N]"; \
		read ans; \
		if [ "$$ans" != "y" ] && [ "$$ans" != "Y" ]; then \
			echo "Skipping alacritty.toml"; \
			exit 0; \
		fi; \
	fi
	cp alacritty.toml ~/.config/alacritty/alacritty.toml
	@echo "Installed alacritty.toml -> ~/.config/alacritty/alacritty.toml"
