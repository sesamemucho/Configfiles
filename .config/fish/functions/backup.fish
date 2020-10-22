function backup
  yadm stash
  yadm pull
  yadm stash pop
  yadm add -u
  yadm add -f ~/.config/fish/functions/*
  yadm commit -m "$argv"
  yadm push
end
