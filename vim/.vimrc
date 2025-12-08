" Copy marked fragment to the X clipboard on CTRL+C
vmap <C-c> "+y
imap <C-v> <Esc>"+pa

set nocompatible
filetype plugin on
set wildmode=longest,list
set background=dark
colorscheme vividchalk
syntax on
set expandtab
set sw=4
set smarttab
set autoindent
set nowrap
set ignorecase
set fileencodings=utf8,iso-8859-2
set pastetoggle=<F2>
map <F3> :set tw=72 fo+=wa1<CR>
map <F4> :set spell<CR>
map <F6> :nohlsearch<CR>
set hlsearch
set nonumber norelativenumber


map u <NOP>
map U <undo>
