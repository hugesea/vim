"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: hugesea at hotmail dot com
"
" How_to_Install:
"    $ mkdir ~/.vim_runtime
"    $ git clone https://github.com/hugesea/vim.git ~/.vim_runtime
"    $ sh ~/.vim_runtime/install.sh
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=300

" Enable filetype plugin
filetype plugin on
filetype indent on

" not vi-compatible
set nocompatible

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set so=8  " Set N lines to the curors - when moving vertical..
set ruler "Always show current position
set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=b,s,<,>,[,]
set matchpairs+=<:>
set selectmode=
set selection=inclusive

" search options
set noignorecase "not ignore case when searching
set hlsearch "Highlight search things
set incsearch "Make search act like search in modern browsers
set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

" Set font according to system
set gfn=Monospace\ 10
set shell=/bin/bash

if has("gui_running")
  set guioptions-=T
  set background=dark
  set t_Co=256
  set background=dark
  colorscheme peaksea

  set nu
else
  colorscheme zellner
  set background=dark

  set nonu
endif

set encoding=utf8
try
  lang en_US
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, file modes and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup filetype
  au! BufNewFile,BufRead SConstruct  set filetype=python
  au! BufNewFile,BufRead *.thrift    set filetype=thrift
  au! BufNewFile,BufRead *.proto     set filetype=proto
  au! BufNewFile,BufRead BUILD       set filetype=blade
augroup end

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=2
set tabstop=2
set smarttab

" make font highlight if the width is more than 80
set textwidth=80
au BufNewFile,BufRead *.c,*.cc,*.cpp,*.h,*.py exec 'match Error /\%>'.(&textwidth).'v./'

set tags+=./tags,tags,.tags,~/code/tags

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines
set lbr

" warning on end space and tab key
set list
set listchars=tab:>-,trail:-

" fold options
set fo+=mB
set foldmethod=syntax
set foldlevel=6

" cpp indent
"set cin
"set cino=l1g0.5sh0.5s

" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_char = '¦'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F2> <ESC>I// <ESC>
map <F3> <ESC>:s/\/\/\ //<ESC>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map gc :tabc<CR>
map gn :tabnew<CR>

" Specify the behavior when switching between buffers
try
  set switchbuf=usetab
  set stal=2
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File template generation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.R,*.sh,*.thrift,*.proto exe '%! autogen %'
autocmd BufNewFile *.py,BUILD exe '%! autogen %'
autocmd BufNewFile *.h,*.cc exe '%! autogen %'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Delete trailing white space
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py,*.h,*.cc :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
