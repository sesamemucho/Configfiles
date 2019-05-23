function mranger
	touch $HOME/.rangerdir
ranger --choosedir=$HOME/.rangerdir
set LASTDIR (cat $HOME/.rangerdir)
cd $LASTDIR
rm $HOME/.rangerdir
end
