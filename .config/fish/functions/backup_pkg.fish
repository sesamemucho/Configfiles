function backup_pkg
	pacman -Qqen > ~/pkglist.txt
    pacman -Qqem > ~/aurpkglist.txt
end
