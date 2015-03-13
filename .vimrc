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
" show line numbers
set number
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
set noshowmode
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""""""""""
" Indenting
""""""""""""""""""""""""""""""""""""""""""""""""
" auto-indent
set noautoindent smartindent
" 2-space indentation; eight-character-wide tabs
set expandtab softtabstop=2 tabstop=8 shiftwidth=2

""""""""""""""""""""""""""""""""""""""""""""""""
" Colours / Styling
""""""""""""""""""""""""""""""""""""""""""""""""
" set background=dark
set background=dark

" turn syntax highlighting on, if it is supported
if &t_Co > 2 || has("gui_running")
	syntax on
	"let base16colorspace=256  " Access colors present in 256 colorspace
	colors base16-eighties
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

" highlight git conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype-Specific Directives
""""""""""""""""""""""""""""""""""""""""""""""""
" Makefiles use real tabs
au FileType make set noexpandtab
" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
" md, markdown, and mk are markdown
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set ft=markdown
" highlight code in fenced blocks in markdown files
let g:markdown_fenced_languages = ['bash=sh', 'c', 'coffee', 'coffeescript=coffee', 'css', 'haskell', 'hs=haskell', 'html', 'javascript', 'js=javascript', 'json', 'purescript', 'purs=purescript', 'ruby', 'rb=ruby', 'sass', 'scss', 'sh', 'xml']
" JSON syntax highlighting
au BufRead,BufNewFile *.json set ft=json
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
" eslint uses four-space indentation
au BufRead,BufNewFile */projects/eslint/*.{js,json} set expandtab tabstop=8 softtabstop=4 shiftwidth=4
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

" Make $ behave consistently in visual mode.
vnoremap $ g_

" Alias H and L to more useful commands, easier to type than their counterparts.
nmap H 0
vmap H 0
nmap L $
vmap L $

" <return> controls folds
map <return> za
map <S-return> zA
map <C-return> zR
map <C-A-return> zM

" Undo/redo using Alt-{left,right}
nmap <A-left> u
nmap <A-right> <C-r>

" Ctrl-page{up,down} navigates buffers
nmap <C-pageup> :bN<return>
nmap <C-pagedown> :bn<return>
imap <C-pageup> <C-o>:bN<return>
imap <C-pagedown> <C-o>:bn<return>

" Ctrl-{h,j,k,l} navigates splits
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
imap <C-h> <C-o><C-w>h
imap <C-j> <C-o><C-w>j
imap <C-k> <C-o><C-w>k
imap <C-l> <C-o><C-w>l

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

" Typos
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>

" <space> clears search highlighting and status bar
nnoremap <space> :nohlsearch<return>:<BS><esc>

" Write with escalated privileges
cnoremap w!! w !sudo tee % >/dev/null

" :clean to remove trailing whitespace
cnoreabbrev <silent> clean %s/[\r \t]\+$//
" :format to auto-format
cnoreabbrev <silent> format %s/[\r \t]\+$//<return>:%s/\([\r\n]\)[\r\n]\+/\1\1/<return>:nohlsearch<return>m'ggVG=`'

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

" forward search for selected text in visual mode using *
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
" reverse search for selected text in visual mode using #
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" \l to toggle visible whitespace
nmap <silent> <leader>l :set list!<return>

" \<space> and \<tab> to toggle between leading spaces and tabs respectively
nmap <silent> <leader><space> :set expandtab softtabstop=2 tabstop=8 shiftwidth=2<return>
nmap <silent> <leader><tab> :set noexpandtab softtabstop=0 tabstop=8 shiftwidth=8<return>
