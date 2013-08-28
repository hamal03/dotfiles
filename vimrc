let mapleader = ","
execute pathogen#infect()
filetype plugin indent on
syntax enable
set background=light

set t_Co=256
set background=light
colorscheme hamallight

set expandtab
set shiftwidth=4
set smarttab
set modeline
set modelines=10
set autoindent
set pastetoggle=<F11>
set number 
set list
set listchars=tab:▸\ ,eol:¬
"let loaded_matchparen = 1

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <s-tab> <c-n>
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

function! ToggleBackground()
    if &background == 'light'
        set background=dark
        colorscheme hamaldark
    else
        set background=light
        colorscheme hamallight
    endif
endfunction
nnoremap <leader>bg :call ToggleBackground()<cr>
nnoremap <F5> :call ToggleBackground()<cr>

nnoremap <leader>nl :set number!<cr>:set list!<cr>
nnoremap <F4> /^-- <CR>0j!Grandsig1.pl<CR>

inoreabbrev plhdr #!/usr/bin/perluse strict;use warnings;

" local stuff
if filereadable(glob("$HOME/.vimrc.local"))
    source $HOME/.vimrc.local
endif
