" Vundle  {{{
filetype off                  " required

let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'sjl/gundo.vim'
Plugin 'autozimu/languageclient-neovim'
Plugin 'junegunn/fzf'
Plugin 'shougo/deoplete.nvim'
Plugin 'rust-lang/rust.vim'
Plugin 'matcatc/vim-asciidoc-folding'
Plugin 'tpope/vim-surround' " change/append sourroundings of sommething, e.g. qoutes, tags
Plugin 'tpope/vim-commentary' " comment/uncomment lines
Plugin 'christoomey/vim-system-copy' " cpit > this copies the content of a tag into your clipboard
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
" Stuff to check out {{{
" Airline - shows buffers for files
" ReplaceWithRegister - make replacing repeatable
" Titlecase - change casing of a line/ a word
" Sortmotion sort stuff alphabetically
" Textobjects - https://github.com/kana/vim-textobj-user/wiki
" }}}
call vundle#end()
" }}}
" Misc {{{
filetype plugin indent on
set shell=bash
syntax enable
colorscheme darcula
set tabstop=4       " number of visual spaces per TAB
" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/
" }}}
" Search {{{
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set hlsearch            " highlight matches
set path +=**
set wildmenu
" }}}
" UI {{{
set number relativenumber " show hybrid line numbers
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
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
" Mappings {{{
" jk is escape
inoremap jk <esc>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" Map the leader key to SPACE
let mapleader="\<SPACE>"
" Use ; for commands.
nnoremap ; :
" Use Q to execute default register.
nnoremap Q @q
"}}}
" Scrolling {{{
if !&scrolloff
        set scrolloff=3       " Show next 3 lines while scrolling.
    endif
    if !&sidescrolloff
        set sidescrolloff=5   " Show next 5 columns while side-scrolling.
    endif
" }}}
" Most stuff from here: https://dougblack.io/words/a-good-vimrc.html
" vim:foldmethod=marker:foldlevel=0
