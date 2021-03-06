execute pathogen#infect()

  set guifont=Misc\ Fixed\ 10
  set guioptions=caL
  " set title titlestring=%t
  set t_Co=256

  "colorscheme desert256
  colorscheme zenburn

  set mouse=a

" Setting it so that tab inserts spaces instead of tabs
  set et

" Setting tab stops to 4
  set ts=4

" attempting to make the title bar blue
" 
" the first ^[ nees to be made by going into insert mode and typeing
" <ctrl>-<v> then <esc>.  This will set the reverse video mode to
" blue, I think.

  "set t_mr=[0;1;37;44m
  "set t_mr=[0;1;37;44m

" autoindent:  "on" as I usually do write code.
  set autoindent

" autowrite "on" saves a lot of trouble
  set   autowrite

" backup:  backups are for wimps  ;-)
  set nobackup

" backspace:  '2' is much smarter. -> "help backspace"
  set backspace=2
  
" compatible:  Let Vim behave like Vi?  Hell, no!
  set nocompatible

" comments default: sr:/*,mb:*,el:*/,://,b:#,:%,:XCOMM,n:>,fb:-
  set comments=b:#,:%,fb:-,n:>,n:)

" dictionary: english words first
  set dictionary=/usr/dict/words,/local/lib/german.words

" errorbells: damn this beep!  ;-)
  set noerrorbells

" esckeys:    allow usage of cursor keys within insert mode
  set esckeys

" helpheight: zero disables this.
  set helpheight=0

" hidden: switch between buffers when they're modified
  set hidden

" highlight=8b,db,es,hs,mb,Mn,nu,rs,sr,tb,vr,ws
  set highlight=8r,db,es,hs,mb,Mr,nu,rs,sr,tb,vr,ws

" hlsearch :  highlight search - show the current search pattern
" This is a nice feature sometimes - but it sure can get in the
" way sometimes when you edit.
  set nohlsearch

" ignorecase:  ignore the case in search patterns?  NO!
  set noignorecase

" start in insert mode?
  set noinsertmode
  
" insert two spaces after a period with every joining of lines.
  set joinspaces

" laststatus:  show status line?  Yes, always!
" laststatus:  Even for only one buffer.
  set laststatus=2

" report: show a report when N lines were changed.
" report=0 thus means "show all changes"!
  set report=0

" ruler:       show cursor position?  Yep!
  set ruler

" magic:       use some magic in search patterns?  Certainly!
  set magic

" modeline:    ...
" Allow the last line to be a modeline - useful when
" the last line in sig gives the preferred textwidth for replies.
  set modeline

" number:      ...
  set nonumber

" setting shell to tcsh
  "set shell=tcsh
  set shell=bash

" shiftwidth:  Number of spaces to use for each
"              insertion of (auto)indent.
  set shiftwidth=4

" shortmess:   Kind of messages to show.   Abbreviate them all!
"              New since vim-5.0v: flag 'I' to suppress "intro message".
  set shortmess=Iat

" showcmd:     Show current uncompleted command?  Absolutely!
  set showcmd

" showmatch:   Show the matching bracket for the last ')'?
  set showmatch

" showmode:    Show the current mode?  YEEEEEEEEESSSSSSSSSSS!
  set showmode

" suffixes:    Ignore filename with any of these suffixes
"              when using the ":edit" command.
"              Most of these are files created by LaTeX.
  set suffixes=.aux,.bak,.dvi,.gz,.idx,.log,.ps,.swp,.tar


" startofline:  no:  do not jump to first character with page
"                    commands, ie keep the cursor in the current column.
  set nostartofline

"  endif

" textmode:    no - I am using Vim on UNIX!
  set notextmode

" textwidth
  set textwidth=79

" ttyfast:     are we using a fast terminal?
"              seting depends on where I use Vim...
  set ttyfast

" ttybuiltin:
  set nottybuiltin
"
" ttyscroll:      turn off scrolling -> faster!
"  set ttyscroll=0

" visualbell:
  set visualbell

" t_vb:  terminal's visual bell - turned off to make Vim quiet!
" Please use this as to not annoy cow-orkers in the same room.
" Thankyou!  :-)
  set t_vb=

" whichwrap:
  set whichwrap=<,>

" wildchar  the char used for "expansion" on the command line
" default value is "<C-E>" but I prefer the tab key:
  set wildchar=<TAB>

" wrapmargin:
  set wrapmargin=1

" writebackup:
  set nowritebackup

" Don't visually match parens
  let loaded_matchparen = 1

" Define "del" char to be the same backspace (saves a LOT of trouble!)
" As the angle notation cannot be use with the LeftHandSide
" with mappings you must type this in *literally*!
  map <C-V>127 <C-H>
  cmap <C-V>127 <C-H>

" Include paths
let &path = ".," . substitute($PathList , ';', ',', 'g')

syntax enable

au BufRead,BufReadPost,BufNewFile *.scr set filetype=tcl
filetype plugin indent on

" OSX config
" -------------------------------------------------------------------
set clipboard=unnamed
" -------------------------------------------------------------------

" Color config
" -------------------------------------------------------------------
highlight TabLine ctermbg=233
highlight TabLineSel ctermbg=237
highlight SignColumn ctermbg=237
" -------------------------------------------------------------------

" Python
" -------------------------------------------------------------------
"autocmd BufWritePost *.py call Flake8()

" to use colors defined in the colorscheme
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg
" -------------------------------------------------------------------

" Syntastic
" -------------------------------------------------------------------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

let g:syntastic_python_checkers = ["flake8"]

map <F12> :Errors <CR>
" -------------------------------------------------------------------

" Go
" -------------------------------------------------------------------
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
au FileType go nmap <leader>dt <Plug>(go-def)
au FileType go nmap <leader>dT <Plug>(go-def-pop)
au FileType go nmap <leader>s <Plug>(go-implements)
au FileType go nmap <leader>i <Plug>(go-info)

map <F2> :GoDef<CR>
map <F3> :GoDefPop<CR>

au FileType go nmap <leader>gd <Plug>(go-doc-split)

au FileType go nmap <leader>ln :lnext<CR>
au FileType go nmap <leader>lp :lprev<CR>

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_autosave = 1
let g:go_metalinter_autosave = 0

let g:go_list_height = 10

let g:go_list_type = "quickfix"

let g:syntastic_go_checkers = ['go', 'golint', 'gofmt']
let g:syntastic_aggregate_errors = 1

" -------------------------------------------------------------------

"
" Highlighting

" Highlighting
" -------------------------------------------------------------------
highlight Pmenu ctermbg=0 ctermfg=248
highlight PmenuSel ctermfg=223 ctermbg=235

"highlight Pmenu guibg=brown gui=bold
"highlight Pmenu ctermbg=0* guibg=grey40
"highlight PmenuSel ctermbg=4 guibg=khaki guifg=slategrey
"highlight PmenuSbar ctermbg=0 guibg=DarkGray
"highlight PmenuThumb guibg=Black

highlight NonText    gui=NONE cterm=NONE
highlight MoreMsg    gui=NONE cterm=NONE
highlight ModeMsg    gui=NONE cterm=NONE
highlight Question   gui=NONE cterm=NONE
highlight Title      gui=NONE cterm=NONE
highlight VisualNOS  gui=NONE cterm=NONE
highlight DiffDelete gui=NONE cterm=NONE
highlight DiffText   gui=NONE cterm=NONE
highlight TabLineSel gui=NONE cterm=NONE
highlight Statement  gui=NONE cterm=NONE
highlight Type       gui=NONE cterm=NONE
" -------------------------------------------------------------------

",v brings up my .vimrc
",V reloads it -- making all changes active (have to save first)
map ,v :sp ~/.vimrc<CR><C-W>_
map <silent> ,V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

map te :tabnew<SPACE>
map tn :tabnew<CR>

map <F1> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

map <F4> :1,$s/test_/xtest_<CR>
map <F5> :1,$s/xtest_/test_<CR>

map ,bp :py print bin(<c-r>=expand("<cword>")<cr>)[2:]<cr>
