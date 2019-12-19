# Defined in - @ line 1
function doomrefresh --description 'alias doomrefresh rg --files ~/.doom.d/ | entr ~/.emacs.d/bin/doom refresh'
	rg --files ~/.doom.d/ | entr ~/.emacs.d/bin/doom refresh $argv;
end
