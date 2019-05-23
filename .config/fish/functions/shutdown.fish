# Defined in - @ line 1
function shutdown --description 'alias shutdown sudo shutdown now'
	sudo shutdown now $argv;
end
