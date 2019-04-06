# Defined in - @ line 0
function cpwd --description 'alias cpwd pwd | xclip -selection clipboard'
	pwd | xclip -selection clipboard $argv;
end
