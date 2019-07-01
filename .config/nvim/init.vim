" vim-plug  {{{
call plug#begin('~/.vim/plugged')
Plug 'Chiel92/vim-autoformat'
Plug 'sjl/gundo.vim'
Plug 'junegunn/fzf'
Plug 'rust-lang/rust.vim'
Plug 'matcatc/vim-asciidoc-folding'
Plug 'tpope/vim-surround' " change/append sourroundings of sommething - cs'} = change sourrounding single quotes with wavy brackets
Plug 'tpope/vim-commentary' " gc-motion to comment/uncomment lines
Plug 'christoomey/vim-system-copy' " cpit > this copies the content of a tag into your clipboard
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-endwise' " Add ending structures in some languages
Plug 'vim-syntastic/syntastic' " syntax highlighting, but need to install linters: https://github.com/vim-syntastic/syntastic
Plug 'majutsushi/tagbar' " show tags from ctags file
Plug 'vim-airline/vim-airline' " shows buffers for files
Plug 'ntpeters/vim-better-whitespace' " better whitespace cleaning
Plug 'nelstrom/vim-visual-star-search' " use * to jump to next instace of current word
Plug 'tpope/vim-eunuch' " use unix commands in vim: https://github.com/tpope/vim-eunuch
Plug 'lokaltog/neoranger'
Plug 'ekalinin/dockerfile.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'lilydjwg/colorizer'
Plug 'rhysd/git-messenger.vim'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'mattn/emmet-vim'
Plug 'cespare/vim-toml'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Stuff to check out {{{
" ReplaceWithRegister - make replacing repeatable
" Titlecase - change casing of a line/ a word
" Sortmotion sort stuff alphabetically
" Textobjects - https://github.com/kana/vim-textobj-user/wiki
" twig highlight - syntax highlighting
" Color preview
" sideways.vim
" }}}
call plug#end()
" }}}
" Misc {{{
filetype plugin indent on
set mouse =
set shell=bash
let $PAGER=''
syntax enable
colorscheme darcula
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/
let g:deoplete#enable_at_startup = 1
" GitGutter{{{
" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn guibg=bg
highlight SignColumn ctermbg=bg
" Update sign column every quarter second
set updatetime=250
" }}}
" }}}
" NetRW{{{
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" }}}
" Search {{{
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set hlsearch            " highlight matches
set path +=**
set wildmenu
" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
" }}}
" UI {{{
set number relativenumber " show hybrid line numbers
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}
" Formatting {{{
" Rust {{{
let g:rustfmt_autosave = 1 " format rust on saving a buffer
" }}}
" HTML (depends on tidy){{{
autocmd FileType html
\ setlocal formatprg=tidy\ -indent\ -quiet\ --show-errors\ 0\ --tidy-mark\ no\ --show-body-only\ auto
" }}}
" }}}
" Syntax Checking {{{
" json syntax highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+
" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}
" }}}
" Folding {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" comma open/closes folds
nnoremap , za
set foldmethod=expr   " fold based on specified expression
set foldmethod=marker
set foldlevel=0
set modelines=1
" }}}
" Autocompletion {{{
" }}}
" Mappings {{{
" Tabs
nnoremap <C-u> :-tabnext
nnoremap <C-i> :+tabnext
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" Map the leader key to SPACE
let mapleader="\<SPACE>"
" Use Q to execute default register.
nnoremap Q @q
" Ranger
nnoremap <leader>f :Ranger<CR>
nmap <F8> :TagbarToggle<CR>
" Disable Scrolling{{{
:nmap <ScrollWheelUp> <nop>
:nmap <S-ScrollWheelUp> <nop>
:nmap <C-ScrollWheelUp> <nop>
:nmap <ScrollWheelDown> <nop>
:nmap <S-ScrollWheelDown> <nop>
:nmap <C-ScrollWheelDown> <nop>
:nmap <ScrollWheelLeft> <nop>
:nmap <S-ScrollWheelLeft> <nop>
:nmap <C-ScrollWheelLeft> <nop>
:nmap <ScrollWheelRight> <nop>
:nmap <S-ScrollWheelRight> <nop>
:nmap <C-ScrollWheelRight> <nop>

:imap <ScrollWheelUp> <nop>
:imap <S-ScrollWheelUp> <nop>
:imap <C-ScrollWheelUp> <nop>
:imap <ScrollWheelDown> <nop>
:imap <S-ScrollWheelDown> <nop>
:imap <C-ScrollWheelDown> <nop>
:imap <ScrollWheelLeft> <nop>
:imap <S-ScrollWheelLeft> <nop>
:imap <C-ScrollWheelLeft> <nop>
:imap <ScrollWheelRight> <nop>
:imap <S-ScrollWheelRight> <nop>
:imap <C-ScrollWheelRight> <nop>
" }}}
" GitGutter {{{
" Jump between hunks
nmap <Leader>gn <Plug>GitGutterNextHunk  " git next
nmap <Leader>gp <Plug>GitGutterPrevHunk  " git previous
" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>GitGutterStageHunk  " git add (chunk)
nmap <Leader>gu <Plug>GitGutterUndoHunk   " git undo (chunk)
" Vimagit {{{
" Open vimagit pane
nnoremap <leader>gs :Magit<CR>       " git status
" Push to remote
nnoremap <leader>gP :! git push<CR>  " git Push
" Enable deletion of untracked files in Magit
let g:magit_discard_untracked_do_delete=1
" }}}
" }}}
" commands {{{
command! Install :w | :source % | :PlugInstall
" }}}
" Snippets {{{
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" }}}
"}}}
" Scrolling {{{
if !&scrolloff
        set scrolloff=3       " Show next 3 lines while scrolling.
    endif
    if !&sidescrolloff
        set sidescrolloff=5   " Show next 5 columns while side-scrolling.
    endif
" }}}
" Snippets {{{
" }}}
" Most stuff from here: https://dougblack.io/words/a-good-vimrc.html
" vim:foldmethod=marker:foldlevel=0
