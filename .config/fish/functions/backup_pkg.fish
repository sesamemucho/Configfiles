function backup_pkg
	sudo dpkg --get-selections > ~/packagelist.txt
end
