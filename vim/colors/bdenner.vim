" Vim color file
" Maintainer:	Bernhard Denner <bernhard.denner@gmail.com>
" Last Change:	2016-11-04

" This is my personal color scheme, derived from the default.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif


hi Visual term=reverse cterm=None ctermbg=235
hi SpellBad ctermbg=black cterm=underline
hi SpellCap ctermbg=black cterm=underline

hi SpecialKey ctermfg=237
hi NonText ctermfg=236

" color of the textwidh limiting line (colorcolumn)
hi ColorColumn term=reverse ctermbg=234

let colors_name = "bdenner"

" vim: sw=2
