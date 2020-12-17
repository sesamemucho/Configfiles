fish_hybrid_key_bindings

eval (direnv hook fish)

zoxide init fish | source
starship init fish | source

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# fenv source ~/.bashrc
