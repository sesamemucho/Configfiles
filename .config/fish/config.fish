fish_vi_key_bindings
# environment variables
set -gx PATH /home/julius/.gem/ruby/2.6.0/bin  $PATH
set -gx PATH /home/julius/.local/bin $PATH
set -gx MANPAGER "nvim -c 'set ft=man' -"
set -gx LESS_TERMCAP_mb \e\[1\;32m
set -gx LESS_TERMCAP_md \e\[1\;32m
set -gx LESS_TERMCAP_me \e\[0m
set -gx LESS_TERMCAP_se \e\[0m
set -gx LESS_TERMCAP_so \e\[01\;33m
set -gx LESS_TERMCAP_ue \e\[0m
set -gx LESS_TERMCAP_us \e\[1\;4\;31m

function fish_title;end

# Colors
set fish_color_normal a9b7c6
set fish_color_command cc7832
set fish_color_quote 5e8759
set fish_color_redirection a9b7c6
set fish_color_end a9b7c6
set fish_color_error bc3f3c
set fish_color_param a9b7c6
set fish_color_comment 808080
set fish_color_match 111111
set fish_color_autosuggestion A9B7C6
set fish_color_cwd CB772F
set fish_color_cancel bc3f3c
set fish_color_user CB772F
set fish_color_host CB772F
