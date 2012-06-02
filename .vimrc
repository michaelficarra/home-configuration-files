" best to put this on the first line
set nocompatible
set encoding=utf-8

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
" don't put cursor at the start of the line unneccessarily
set nostartofline
" enable folding by indentation level by default
set foldmethod=indent foldminlines=3 foldlevel=99
" automatically insert leading comment characters when pressing <enter> in insert mode
set formatoptions+=r
" don't insert leading comment characters when pressing `o` or `O` in normal mode
set formatoptions-=o
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
" always display the status bar
set laststatus=2
" 10ms multi-byte keycode timeout avoids input delay
set ttimeoutlen=10
" use :set list! to toggle visible whitespace on/off
set listchars=tab:\¦—,nbsp:\␣,trail:\·,eol:\↵,extends:\»,precedes:\«

""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen
call pathogen#infect()
syntax on
filetype plugin indent on
" vim-powerline
let g:Powerline_symbols = 'fancy'
" don't need to see the mode in the command line if we have vim-powerline enabled
set noshowmode
"let g:Powerline_colorscheme = 'zend55'
"let g:Powerline#Colorschemes#zend55#colorscheme = Pl#Colorscheme#Init([
"  \ Pl#Colorscheme#HiSegment(['SPLIT'],                               Pl#Hi#Create(Pl#Hi#Cterm(  0, 234)        ), { 'N': Pl#Hi#Create(Pl#Hi#Cterm(  0, 234)        ), 'i': Pl#Hi#Create(Pl#Hi#Cterm(  0, 234)        ), } ),
"  \ Pl#Colorscheme#HiSegment(['mode_indicator'],                      Pl#Hi#Create(Pl#Hi#Cterm(250, 238)        ), {                                                   'i': Pl#Hi#Create(Pl#Hi#Cterm(250, 238)        ), 'v': Pl#Hi#Create(Pl#Hi#Cterm(250, 238)        ), 'r': Pl#Hi#Create(Pl#Hi#Cterm(250, 238)        ), 's': Pl#Hi#Create(Pl#Hi#Cterm(250, 238)        ) } ),
"  \ Pl#Colorscheme#HiSegment(['branch',
"  \                           'scrollpercent',
"  \                           'raw',
"  \                           'filesize']     ,                       Pl#Hi#Create(Pl#Hi#Cterm(250, 236)        ), { 'N': Pl#Hi#Create(Pl#Hi#Cterm(250, 236)        ), 'i': Pl#Hi#Create(Pl#Hi#Cterm(250, 236)        ), } ),
"  \ Pl#Colorscheme#HiSegment(['fileinfo',
"  \                           'filename'],                            Pl#Hi#Create(Pl#Hi#Cterm(250, 236)        ), { 'N': Pl#Hi#Create(Pl#Hi#Cterm(250, 236)        ), 'i': Pl#Hi#Create(Pl#Hi#Cterm(250, 236)        ), } ),
"  \ Pl#Colorscheme#HiSegment(['static_str'],                          Pl#Hi#Create(Pl#Hi#Cterm(250, 236)        ), { 'N': Pl#Hi#Create(Pl#Hi#Cterm(250, 235)        ), 'i': Pl#Hi#Create(Pl#Hi#Cterm(250, 236)        ), } ),
"  \ Pl#Colorscheme#HiSegment(['fileinfo.flags'],                      Pl#Hi#Create(Pl#Hi#Cterm(196     )        ), { 'N': Pl#Hi#Create(Pl#Hi#Cterm(196     )        ), 'i': Pl#Hi#Create(Pl#Hi#Cterm(196     )        ), } ),
"  \ Pl#Colorscheme#HiSegment(['current_function',
"  \                           'fileformat',
"  \                           'fileencoding',
"  \                           'pwd',
"  \                           'filetype',
"  \                           'rvm:string',
"  \                           'rvm:statusline',
"  \                           'virtualenv:statusline',
"  \                           'charcode'],                            Pl#Hi#Create(Pl#Hi#Cterm(250, 234)        ), {                                                   'i': Pl#Hi#Create(Pl#Hi#Cterm(250, 234)        ), } ),
"  \ Pl#Colorscheme#HiSegment(['lineinfo'],                            Pl#Hi#Create(Pl#Hi#Cterm(250, 238)        ), { 'N': Pl#Hi#Create(Pl#Hi#Cterm(250, 238)        ), 'i': Pl#Hi#Create(Pl#Hi#Cterm(250, 238)        ), } ),
"  \ Pl#Colorscheme#HiSegment(['errors'],                              Pl#Hi#Create(Pl#Hi#Cterm(196, 234), 'bold'), {                                                   'i': Pl#Hi#Create(Pl#Hi#Cterm(196, 234), 'bold'), } ),
"  \ Pl#Colorscheme#HiSegment(['lineinfo.line.tot'],                   Pl#Hi#Create(Pl#Hi#Cterm(250, 238)        ), { 'N': Pl#Hi#Create(Pl#Hi#Cterm(250, 238)        ), 'i': Pl#Hi#Create(Pl#Hi#Cterm(250, 238)        ), } ),
"  \
"  \ Pl#Colorscheme#HiSegment(['gundo:static_str.name',
"  \                           'command_t:static_str.name',
"  \                           'lustyexplorer:static_str.name',
"  \                           'minibufexplorer.static_str.name'],     Pl#Hi#Create(Pl#Hi#Cterm(231, 124), 'bold'), { 'N': Pl#Hi#Create(Pl#Hi#Cterm(160,  52), 'bold'), } ),
"  \ Pl#Colorscheme#HiSegment(['gundo:static_str.buffer',
"  \                           'command_t:raw.line',
"  \                           'lustyexplorer:static_str.buffer'],     Pl#Hi#Create(Pl#Hi#Cterm(231,  88)        ), { 'N': Pl#Hi#Create(Pl#Hi#Cterm(160,  52)        ), } ),
"  \ Pl#Colorscheme#HiSegment(['gundo:SPLIT',
"  \                           'command_t:SPLIT',
"  \                           'lustyexplorer:SPLIT',
"  \                           'minibufexplorer:SPLIT'],               Pl#Hi#Create(Pl#Hi#Cterm(  0,  88)        ), { 'N': Pl#Hi#Create(Pl#Hi#Cterm(  0,  52)        ), } ),
"  \
"  \ Pl#Colorscheme#HiSegment(['tagbar:static_str.name'],              Pl#Hi#Create(Pl#Hi#Cterm(231,  70), 'bold'), { 'N': Pl#Hi#Create(Pl#Hi#Cterm( 70,  22), 'bold'), } ),
"  \ Pl#Colorscheme#HiSegment(['tagbar:static_str.buffer'],            Pl#Hi#Create(Pl#Hi#Cterm(148,  28)        ), { 'N': Pl#Hi#Create(Pl#Hi#Cterm( 70,  22)        ), } ),
"  \ Pl#Colorscheme#HiSegment(['tagbar:SPLIT'],                        Pl#Hi#Create(Pl#Hi#Cterm(  0,  28)        ), { 'N': Pl#Hi#Create(Pl#Hi#Cterm(  0,  22)        ), } ),
"\ ])

""""""""""""""""""""""""""""""""""""""""""""""""
" Indenting
""""""""""""""""""""""""""""""""""""""""""""""""
" auto-indent
set noautoindent smartindent
" four-character-wide tabs
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
au FileType python set expandtab softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
" whitespace (http://compsoc.dur.ac.uk/whitespace/)
au FileType whitespace set nowrap noexpandtab tabstop=1
" Haskell and CoffeeScript use two-space indentation
au FileType haskell set expandtab softtabstop=2 tabstop=8 shiftwidth=2
au FileType coffee set expandtab softtabstop=2 tabstop=8 shiftwidth=2
" jashkenas/coffee-script files use two-space indentation
au BufRead,BufNewFile */projects/coffee-script/*.{coffee,js} set expandtab tabstop=8 softtabstop=2 shiftwidth=2
au BufRead,BufNewFile */projects/coffee-script/Cakefile set expandtab tabstop=8 softtabstop=2 shiftwidth=2
" so does bloom/bud
au BufRead,BufNewFile */projects/bud/*.rb set expandtab tabstop=8 softtabstop=2 shiftwidth=2
au BufRead,BufNewFile *.bud set ft=ruby
" allow longer lines in LaTeX documents; also, auto-wrap at that length
au FileType tex set textwidth=120 wrapmargin=120 nojoinspaces autoindent nosmartindent

""""""""""""""""""""""""""""""""""""""""""""""""
" Macros / Key Bindings
""""""""""""""""""""""""""""""""""""""""""""""""
" don't move the cursor after pasting
"nnoremap p p`[
"nnoremap P P`[

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

" disable Shift-{up,down}
map <S-up> <up>
imap <S-up> <up>
" -down
map <S-down> <down>
imap <S-down> <down>

" Shift-{left,right} moves by WORDS
map <S-left> B
imap <S-left> <C-o>B
" -down
map <S-right> W
imap <S-right> <C-o>W

" {k,j,up,down} go up and down visually
map k gk
map j gj
map <up> gk
map <down> gj
imap <up> <C-o>gk
imap <down> <C-o>gj

" <return> controls folds
map <return> za
map <S-return> zA
map <C-return> zR
map <C-A-return> zM

" Undo/redo using Alt-{left,right}
nmap <A-left> u
nmap <A-right> <C-r>

" Ctrl-page{up,down} navigates open files
nmap <C-pageup> :bN<return>
nmap <C-pagedown> :bn<return>
imap <C-pageup> <esc>:bN<return>
imap <C-pagedown> <esc>:bn<return>

" <home> toggles between start of line and start of text
imap <khome> <home>
nmap <khome> <home>
inoremap <silent> <home> <C-O>:call Home()<return>
nnoremap <silent> <home> :call Home()<return>
function Home()
	let curcol = wincol()
	normal ^
	if wincol() == curcol
		normal 0
	endif
endfunction

" <tab> indents in visual mode
vmap <tab> >
vmap <s-tab> <
" <tab><tab> indents without visual selection
nmap <tab><tab> >>
nmap <s-tab><s-tab> <<

" bring back Q: format paragraph containing cursor
nnoremap Q gwap
" Q for visual mode, too
vnoremap Q gw

" typos
cnoreabbr W w
cnoreabbr Wq wq

" Some key bindings from other editors
nmap <c-d> yyp`[
vmap <c-d> y[p
"nmap <c-l> dd
nmap <c-s> :update<return>
"nmap <c-w> :q<return>
nmap <c-q> :qa<return>

nnoremap <space> :nohlsearch<return>

" :clean to remove trailing whitespace
cnoreabbrev clean %s/[\r \t]\+$//
" :format to auto-format
cnoreabbrev format %s/[\r \t]\+$//<return>:%s/\([\r\n]\)[\r\n]\+/\1\1/<return>:nohlsearch<return>m'ggVG=`'

" rake/make integration
cnoreabbrev <silent> rake !rake
cnoreabbrev <silent> Rake !rake
cnoreabbrev <silent> make !make
cnoreabbrev <silent> Make !make

" <leader> is the user modifier key (like g is the vim modifier key)
" <leader> can be changed from the default of \ using: let mapleader = ","

" X clipboard integration using xclip
vnoremap <silent> <leader>c :!xclip -f -sel clip<return>
nnoremap <silent> <leader>v m`:r !xclip -o -sel clip<return>``

" \l to toggle visible whitespace
nmap <silent> <leader>l :set list!<return>

" \<space> and \<tab> to toggle between leading spaces and tabs respectively
nmap <silent> <leader><space> :set expandtab tabstop=4 softtabstop=2 shiftwidth=2<return>
nmap <silent> <leader><tab> :set noexpandtab tabstop=4 softtabstop=0 shiftwidth=4<return>
