set nocompatible
set nowrap
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set showmatch
set ruler
set incsearch
set backspace=indent,eol,start
set history=2500
set showcmd
set hlsearch
syntax on
colors jellybeans
command Clean %s/[\r \t]\+$//g
vmap <F6> :!xclip -f -sel clip<CR>
map <F7> mz:-1r !xclip -o -sel clip<CR>`z
