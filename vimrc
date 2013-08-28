let mapleader = ","
execute pathogen#infect()
filetype plugin indent on
syntax enable
"set background=light

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
"set number 
"set list
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

"map <F5> /)<CR>ls<CR><ESC>
"map <F6> yyPkJWWDjddkJmaGp'a
"map <F8> /^([0-9]\+:[0-9:-]\+)<CR>
"map <F3> ^Wcw<CR><ESC>k:r!echo $RANDOM<CR>kJJx
nnoremap <leader>n :set number!<cr>:set list!<cr>
nnoremap <F2> ^Wcw<CR><Esc>k:r!echo $RANDOM<CR>kJJx
nnoremap <F3> aGondel 1:<ESC>^Wcw<CR><Esc>k:r!echo $RANDOM<CR>kJJx
nnoremap <F4> /^-- <CR>0j!Grandsig1.pl<CR>
"nnoremap <F5> lBi<span class=versno-end><ESC>Ea</span><ESC>
"nnoremap <F7> lBi<span class=versno><ESC>Ea</span><ESC>
nnoremap <F8> /\<\[\?[0-9][0-9]*\(-[0-9][0-9]*\)\?\]\? <CR>

inoreabbrev plhdr #!/usr/bin/perluse strict;use warnings;
