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
let g:colors_name = "hamallight"

" hardcoded colors :
" GUI Comment : #80a0ff = Light blue

highlight Normal     ctermfg=233	ctermbg=White   cterm=NONE
highlight Search     ctermfg=NONE       ctermbg=11      cterm=NONE
highlight Visual     ctermfg=NONE       ctermbg=249     cterm=NONE
highlight Special    ctermfg=130        ctermbg=NONE    cterm=NONE
highlight Comment    ctermfg=18         ctermbg=NONE    cterm=NONE
highlight StatusLine ctermfg=White      ctermbg=17      cterm=NONE
highlight Statement  ctermfg=58         ctermbg=NONE    cterm=NONE
highlight LineNr     ctermfg=White      ctermbg=245     cterm=NONE
highlight NonText    ctermfg=249        ctermbg=NONE    cterm=NONE
highlight SpecialKey ctermfg=249        ctermbg=NONE    cterm=NONE
highlight Type       ctermfg=22         ctermbg=NONE    cterm=NONE
highlight Constant   ctermfg=52         ctermbg=NONE    cterm=NONE
highlight Folded     ctermfg=NONE       ctermbg=245     cterm=NONE
highlight FoldColumn ctermfg=NONE       ctermbg=245     cterm=NONE
highlight PreProc    ctermfg=53         ctermbg=NONE    cterm=NONE
highlight Identifier ctermfg=23         ctermbg=NONE    cterm=NONE
highlight DiffAdd    ctermfg=White      ctermbg=22      cterm=NONE
highlight DiffDelete ctermfg=White      ctermbg=124     cterm=NONE
highlight DiffChange ctermfg=Black      ctermbg=254     cterm=NONE
highlight DiffText   ctermfg=Black      ctermbg=51      cterm=NONE
highlight SpellBad   ctermfg=11         ctermbg=160     cterm=NONE
highlight SpellCap   ctermfg=11         ctermbg=20      cterm=NONE
