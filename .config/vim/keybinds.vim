let mapleader = " "

nnoremap <leader>cd :Ex<CR>
nnoremap ; :

" A bit of magic to make life easier
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap J mzJ`z

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap n nzzzv
nnoremap N Nzzzv

vnoremap > >gv
vnoremap < <gv

" 14
nnoremap + <C-a>
nnoremap - <C-x>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Fzf keybinds
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fr :History<CR>
nnoremap <leader>fb :Buffers<CR>

" nnoremap <leader>fw :Rg<CR>
