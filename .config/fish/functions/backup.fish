function backup
yadm pull
yadm add -u
yadm add -f ~/.config/fish/functions/*
yadm commit -m "$argv"
yadm push
end
