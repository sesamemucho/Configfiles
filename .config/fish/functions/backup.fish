function backup
    yadm pull
    yadm add ~/*
    yadm add -u
    yadm add -f ~/.config/fish/functions/*
    yadm add -f ~/.emacs.d/snippets/**
yadm commit -m "$argv"
yadm push
end
