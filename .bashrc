[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export TERMINAL=kitty
export LAUNCHER=rofi
force_color_prompt=yes

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/julius/google-cloud-sdk/path.bash.inc' ]; then . '/home/julius/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/julius/google-cloud-sdk/completion.bash.inc' ]; then . '/home/julius/google-cloud-sdk/completion.bash.inc'; fi
