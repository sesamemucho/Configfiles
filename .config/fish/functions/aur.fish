function aur
	git clone https://aur.archlinux.org/$argv.git
cd $argv
makepkg -si
end
