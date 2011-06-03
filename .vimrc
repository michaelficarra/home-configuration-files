" best to put this on the first line
set nocompatible

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
" swap file directories
set backupdir=~/.vim/backup,.,~
set directory=~/.vim/backup,.,~

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
" global search/replace by default
set gdefault
" highlight matched search pattern
set hlsearch
" keep cursor away from vertical edge of terminal
set scrolloff=1
" use :set list! to toggle visible whitespace on/off
set listchars=tab:\¦—,nbsp:\␣,trail:\·,eol:\↵,extends:\»,precedes:\«

""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""
" Indenting
""""""""""""""""""""""""""""""""""""""""""""""""
" auto-indent
set noautoindent smartindent
" 4-character-wide tabs
set noexpandtab
set tabstop=4
set shiftwidth=4

""""""""""""""""""""""""""""""""""""""""""""""""
" Colours / Styling
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
highlight RedundantSpaces ctermbg=red
match RedundantSpaces /\s\+$\|[^\t]\zs\t\+\|\t\zs \+/ "\zs sets start of match so only tabs highlighted

" highlight TODO notes
highlight Todo ctermfg=darkgrey ctermbg=yellow

""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype-Specific Directives
""""""""""""""""""""""""""""""""""""""""""""""""
" Makefiles use real tabs
au FileType make set noexpandtab
" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
" md, markdown, and mk are markdown
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set ft=markdown
" JSON syntax highlighting
au BufRead,BufNewFile *.json set ft=javascript
" python should follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
" whitespace (http://compsoc.dur.ac.uk/whitespace/)
au FileType whitespace set nowrap noexpandtab tabstop=1
" jashkenas/coffee-script files use canonical two-space indentation
au BufRead,BufNewFile */projects/coffee-script/*.coffee set expandtab softtabstop=2 tabstop=1 shiftwidth=2

""""""""""""""""""""""""""""""""""""""""""""""""
" Macros / Key Bindings
""""""""""""""""""""""""""""""""""""""""""""""""
" allow deleting selection without updating the yank buffer
noremap x "_x
noremap X "_X

" don't move the cursor after pasting
nnoremap p p`[
nnoremap P P`[

" Ctrl-{direction} to scroll
" -up
map <C-k> <C-y>
map <C-up> <C-y>
imap <C-up> <C-o><C-y>
" -down
map <C-j> <C-e>
map <C-down> <C-e>
imap <C-down> <C-o><C-e>
" -left
map <C-left> 2zh
imap <C-left> <C-o>2zh
" -right
map <C-right> 2zl
imap <C-right> <C-o>2zl

" {k,j,up,down} go up and down visually
map k gk
map j gj
map <up> gk
map <down> gj

" Undo/redo using Alt-{left,right}
nmap <A-left> u
nmap <A-right> <C-r>

" Ctrl-page{up,down} navigates open files
"nmap <C-pageup> :N<return>
"nmap <C-pagedown> :n<return>
nmap <C-pageup> :bN<return>
nmap <C-pagedown> :bn<return>

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
nmap <tab><tab> >>
nmap <s-tab><s-tab> <<

" typos
cnoreabbr W w
cnoreabbr Wq wq

" Some familiar key bindings from Notepad++ / Scintilla
nmap <c-d> yyp`[
vmap <c-d> y[p
nmap <c-l> dd
nmap <c-s> :update<return>
nmap <c-w> :q<return>
nmap <c-q> :qa<return>

nnoremap <Space> :nohlsearch<return>

" :clean to remove trailing whitespace
cabbrev clean %s/[\r \t]\+$//
" :format to auto-format
cabbrev format %s/[\r \t]\+$//<return>:%s/\([\r\n]\)[\r\n]\+/\1\1/<return>:nohlsearch<return>m'ggVG=`'

" <leader> is the user modifier key (like g is the vim modifier key)
" <leader> can be changed from the default of \ using: let mapleader = ","

" X clipboard integration using xclip
vnoremap <silent> <leader>c :!xclip -f -sel clip<return>
nnoremap <silent> <leader>v m`:r !xclip -o -sel clip<return>``

" \l to toggle visible whitespace
nmap <silent> <leader>l :set list!<return>
