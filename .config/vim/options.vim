syntax on
set termguicolors

set number
set relativenumber

filetype plugin indent on

set backspace=indent,eol,start
set clipboard^=unnamedplus

set wrap
set mouse=a

set expandtab
set autoindent
set smartindent
set smarttab
set breakindent

set tabstop=4
set softtabstop=4
set shiftwidth=4

" Basic completion
set completeopt=menu,menuone,noselect
set shortmess+=c

" Cursor styling because I am crazy lol
let &t_EI = "\e[2 q" " Normal
let &t_SI = "\e[4 q" " Insert
let &t_SR = "\e[3 q" " Replace

" Reset the cursor on start (for older version, mine is old I supose)
augroup myCmds
    au!
    autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END
