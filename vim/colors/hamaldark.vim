" Vim color file
" Maintainer:	Thorsten Maerz <info@netztorte.de>
" Last Change:	2006 Dec 07
" grey on black
" optimized for TFT panels

"set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "hamaldark"

" hardcoded colors :
" GUI Comment : #80a0ff = Light blue

" GUI
"highlight Normal     guifg=Grey80	guibg=Black
"highlight Search     guifg=Black	guibg=Red	gui=bold
"highlight Visual     guifg=#404040			gui=bold
"highlight Cursor     guifg=Black	guibg=Green	gui=bold
"highlight Special    guifg=Orange
"highlight Comment    guifg=#80a0ff
"highlight StatusLine guifg=blue		guibg=white
"highlight Statement  guifg=Yellow			gui=NONE
"highlight Type						gui=NONE

" Console
highlight Normal     ctermfg=254        ctermbg=Black   cterm=NONE
highlight Search     ctermfg=NONE       ctermbg=17      cterm=NONE
highlight Visual     ctermfg=NONE       ctermbg=238     cterm=NONE
highlight Special    ctermfg=208        ctermbg=NONE    cterm=NONE
highlight Comment    ctermfg=20         ctermbg=NONE    cterm=NONE
highlight StatusLine ctermfg=Black      ctermbg=123     cterm=NONE
highlight Statement  ctermfg=184        ctermbg=NONE    cterm=NONE
highlight LineNr     ctermfg=black      ctermbg=242     cterm=NONE
highlight NonText    ctermfg=238        ctermbg=NONE    cterm=NONE
highlight SpecialKey ctermfg=238        ctermbg=NONE    cterm=NONE
highlight Type       ctermfg=40         ctermbg=NONE    cterm=NONE
highlight Constant   ctermfg=9          ctermbg=NONE    cterm=NONE
highlight Folded     ctermfg=NONE       ctermbg=242     cterm=NONE
highlight FoldColumn ctermfg=NONE       ctermbg=242     cterm=NONE
highlight PreProc    ctermfg=164        ctermbg=NONE    cterm=NONE
highlight Identifier ctermfg=44         ctermbg=NONE    cterm=NONE
highlight DiffAdd    ctermfg=White      ctermbg=22      cterm=NONE
highlight DiffDelete ctermfg=White      ctermbg=124     cterm=NONE
highlight DiffChange ctermfg=White      ctermbg=233     cterm=NONE
highlight DiffText   ctermfg=White      ctermbg=23      cterm=NONE
highlight SpellBad   ctermfg=11         ctermbg=160     cterm=NONE
highlight SpellCap   ctermfg=11         ctermbg=20      cterm=NONE
"highlight Cursor     ctermfg=Red	ctermbg=Green	cterm=bold

