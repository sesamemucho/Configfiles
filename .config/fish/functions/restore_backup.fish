function restore_backup
	cd
git pull
sudo dpkg --set-selections < ~/packagelist.txt
sudo apt-get -u dselect-upgrade
end
