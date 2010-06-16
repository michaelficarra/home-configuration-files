""""""""""""""""""""""""""""""""""""""""""""""""
" Functionality
""""""""""""""""""""""""""""""""""""""""""""""""
" set console title to open file name
set title
" ignore case during searches unless capitals are used
set ignorecase
set smartcase
" BASH-style tab completion for filenames
set wildmode=longest:full
set wildmenu
" This is necessary to allow pasting from outside vim. It turns off auto stuff.
" You can tell you are in paste mode when the ruler is not visible
set pastetoggle=<F2>
" disables the bell noise and removes any associated delay
set visualbell t_vb=
" allow switching files and buffers without saving
set hidden
" allow backspacing over everything
set backspace=indent,eol,start
" keep 50 commands in history
set history=50

""""""""""""""""""""""""""""""""""""""""""""""""
" Display
""""""""""""""""""""""""""""""""""""""""""""""""
" show command being entered
set showcmd
" do not wrap long lines of text
set nowrap
" always show cursor
set ruler
" highlight the cursor's line
set cursorline
" highlight the cursor's column
set cursorcolumn
set showmatch
" search as you type
set incsearch
" highlight matched search pattern
set hlsearch

" use :set list! to toggle visible whitespace on/off
set listchars=tab:\¦—,trail:\·,eol:\↵,extends:\»,precedes:\«

""""""""""""""""""""""""""""""""""""""""""""""""
" Indenting
""""""""""""""""""""""""""""""""""""""""""""""""
" auto-indent
set noautoindent smartindent
" 4-character-wide tabs
set tabstop=4
set shiftwidth=4

""""""""""""""""""""""""""""""""""""""""""""""""
" Colors / Styling
""""""""""""""""""""""""""""""""""""""""""""""""
" set background=dark
set background=dark

" turn syntax highlighting on, if it is supported
if &t_Co > 2 || has("gui_running")
	syntax on
	colors jellybeans
endif

" syntax highlight shell scripts as per POSIX,
" not the original Bourne shell which very few use
let g:is_posix = 1

" make the completion menus readable
highlight Pmenu ctermfg=0 ctermbg=3
highlight PmenuSel ctermfg=0 ctermbg=7

" flag problematic whitespace (trailing spaces and spaces before tabs)
highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted

""""""""""""""""""""""""""""""""""""""""""""""""
" Macros / Key Bindings
""""""""""""""""""""""""""""""""""""""""""""""""
" command to remove trailing whitespace
command Clean %s/[\r \t]\+$//g

" X clipboard integration using xclip
vmap <F6> :!xclip -f -sel clip<CR>
map <F7> m`:r !xclip -o -sel clip<CR>``

" allow deleting selection without updating the yank buffer
vnoremap x "_x
vnoremap X "_X

" don't move the cursor after pasting
noremap p p`[
noremap P P`[

" Ctrl-{up,down} to scroll
nmap <C-up> <C-y>
imap <C-up> <C-o><C-y>
nmap <C-down> <C-e>
imap <C-down> <C-o><C-e>

" <home> toggles between start of line and start of text
imap <khome> <home>
nmap <khome> <home>
inoremap <silent> <home> <C-O>:call Home()<CR>
nnoremap <silent> <home> :call Home()<CR>
function Home()
	let curcol = wincol()
	normal ^
	let newcol = wincol()
	if newcol == curcol
		normal 0
	endif
endfunction

" <leader> is the user modifier key (like g is the vim modifier key)
" <leader> can be changed from the default of \ using: let mapleader = ","

" \n to turn off search highlighting
nmap <silent> <leader>n :silent :nohlsearch<CR>
" \l to toggle visible whitespace
nmap <silent> <leader>l :set list!<CR>
