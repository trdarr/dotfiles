execute pathogen#infect()

filetype plugin indent on
syntax on

set autoindent
set backspace=indent,eol,start
set expandtab
set nowrap
set number
set shiftwidth=2
set tabstop=2

let base16colorspace=256
colorscheme base16-eighties
let g:airline_theme='base16_eighties'


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-n> :NERDTreeToggle<CR>

let g:ctrlp_custom_ignore = 'node_modules,.git,__pycache__'
let g:NERDTreeIgnore = ['node_modules', '.git', '__pycache__']
let g:NERDTreeMinimalUI = 1
