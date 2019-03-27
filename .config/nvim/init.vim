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
call vundle#end()            " required
" }}}
" Misc {{{
filetype plugin indent on  
set shell=bash
syntax enable
colorscheme darcula
set path +=**
set wildmenu
set tabstop=4       " number of visual spaces per TAB
set hlsearch            " highlight matches
" }}}
" UI {{{
set number              " show line numbers
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
" }}}
" Folding {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
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
"}}}

" Most stuff from here: https://dougblack.io/words/a-good-vimrc.html
" vim:foldmethod=marker:foldlevel=0
