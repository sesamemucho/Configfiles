fish_default_key_bindings
# environment variables
set -gx PATH /home/julius/.gem/ruby/2.6.0/bin  $PATH

set -Ux PAGER "/bin/sh -c \"unset PAGER;col -b -x | \
    nvim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
	-c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
	-c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

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
