set nocompatible

syntax on

set smartindent

let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
    set noexpandtab
else
    set expandtab
    set tabstop=4
    set shiftwidth=4
endif

set timeout ttimeoutlen=100 timeoutlen=5000

filetype plugin indent on
syntax enable

au FileType tex set spell

au FileType scala set shiftwidth=2
au FileType python set shiftwidth=2

au BufRead,BufNewFile *.scala set filetype=scala
au! Syntax scala source ~/.vim/syntax/scala.vim

set scrolloff=999

set encoding=utf-8

if has("gui_running") 
    colorscheme desert
else
    colorscheme desert
endif

highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%>80v.\+/

set tw=80

set laststatus=2
set statusline=
set statusline+=%-3.3n\
set statusline+=%f\
set statusline+=%h%m%r%w
set statusline+=\[%{strlen(&ft)?&ft:'none'}]
set statusline+=%=
set statusline+=0x%-8B
set statusline+=%-14(%l,%c%V%)
set statusline+=%<%P

set ruler

set linebreak

set showcmd

nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

set incsearch

set ignorecase

set wildmenu

set showmode

set visualbell

noremap <tab> <c-r>=Smart_TabComplete()<CR>
