""""""""""""""""""""""""""""""""""""""""""""""""
" Functionality
""""""""""""""""""""""""""""""""""""""""""""""""
" set console title to open file name
set title
" ignore case during searches unless capitals are used
set ignorecase smartcase
" BASH-style tab completion for filenames
set wildmenu wildmode=longest:full
" allow pasting from outside vim, disabling auto-indent and others
set pastetoggle=<F2>
" disables the bell noise and removes any associated delay
set noerrorbells visualbell t_vb=
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
" show the current editing mode on the last line
set showmode
" do not wrap long lines of text
set nowrap
" always show cursor
set ruler
" highlight the cursor's line
set cursorline
" highlight the cursor's column
set cursorcolumn
" flash matching bracket on insert
set showmatch
" search as you type
set incsearch
" highlight matched search pattern
set hlsearch
" keep cursor away from edge of terminal
set scrolloff=2

" use :set list! to toggle visible whitespace on/off
set listchars=tab:\¦—,nbsp:\␣,trail:\·,eol:\↵,extends:\»,precedes:\«

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
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\|[^\t]\zs\t\+\|\t\zs \+/ "\zs sets start of match so only tabs highlighted

" highlight TODO notes
highlight Todo ctermfg=darkgrey ctermbg=yellow

""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""
" Macros / Key Bindings
""""""""""""""""""""""""""""""""""""""""""""""""
" command to remove trailing whitespace
command Clean %s/[\r \t]\+$//g

" X clipboard integration using xclip
vnoremap <F6> :!xclip -f -sel clip<CR>
nnoremap <F7> m`:r !xclip -o -sel clip<CR>``

" allow deleting selection without updating the yank buffer
vnoremap x "_x
vnoremap X "_X

" don't move the cursor after pasting
nnoremap p p`[
nnoremap P P`[

" Ctrl-{direction} to scroll
nmap <C-up> <C-y>
imap <C-up> <C-o><C-y>
nmap <C-down> <C-e>
imap <C-down> <C-o><C-e>
nmap <C-left> 2zh
imap <C-left> <C-o>2zh
nmap <C-right> 2zl
imap <C-right> <C-o>2zl

" Ctrl-{k,j} and <up>/<down> go up and down visually
nmap <C-K> gk
nmap <C-J> gj
nmap <Up> gk
nmap <Down> gj

" Undo/redo using Alt-{left,right}
nmap <A-left> u
nmap <A-right> <C-r>

" Ctrl-page{up,down} navigates open files
nmap <C-pageup> :N<return>
nmap <C-pagedown> :n<return>

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

" <tab> indents in visual mode
vmap <tab> >
vmap <s-tab> <
" <tab><tab> indents without visual selection
nmap <tab><tab> <S-v>>
nmap <s-tab><s-tab> <S-v><

" typos
cnoreabbr W w
cnoreabbr Wq wq

" Some familiar key bindings from Notepad++ / Scintilla
nmap <c-d> yyp`[
nmap <c-l> dd
nmap <c-s> :w<return>
nmap <c-w> :q<return>

" <leader> is the user modifier key (like g is the vim modifier key)
" <leader> can be changed from the default of \ using: let mapleader = ","

" \n to turn off search highlighting
nmap <silent> <leader>n :silent :nohlsearch<CR>
" \l to toggle visible whitespace
nmap <silent> <leader>l :set list!<CR>
