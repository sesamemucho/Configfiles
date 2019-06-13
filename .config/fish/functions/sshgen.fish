# Defined in - @ line 1
function sshgen --description 'alias sshgen ssh-keygen -t rsa -b 4096 -C "julius.dehner@gmail.com"'
	ssh-keygen -t rsa -b 4096 -C "julius.dehner@gmail.com" $argv;
end
