# Defined in - @ line 1
function gl --description 'alias gl git log --graph --decorate --pretty=oneline --abbrev-commit'
	git log --graph --decorate --pretty=oneline --abbrev-commit $argv;
end
