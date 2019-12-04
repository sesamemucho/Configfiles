[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export TERMINAL=kitty
export LAUNCHER=rofi
force_color_prompt=yes

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/julius/google-cloud-sdk/path.bash.inc' ]; then . '/home/julius/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/julius/google-cloud-sdk/completion.bash.inc' ]; then . '/home/julius/google-cloud-sdk/completion.bash.inc'; fi
