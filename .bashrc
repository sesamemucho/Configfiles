[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"

# Use colors for less, man, etc.
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP
export TERMINAL=kitty
export LAUNCHER=rofi
export SHELL="/bin/fish"
force_color_prompt=yes

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/julius/google-cloud-sdk/path.bash.inc' ]; then . '/home/julius/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/julius/google-cloud-sdk/completion.bash.inc' ]; then . '/home/julius/google-cloud-sdk/completion.bash.inc'; fi
