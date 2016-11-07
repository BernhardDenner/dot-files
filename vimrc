" Bdenner vimrc file
"
" Based on vimrc_example.vim
"
"
" pathogen
" To disable a plugin, add it's bundle name to the following list
"let g:pathogen_blacklist = ['vim-airline']
let g:pathogen_blacklist = ['lightline.vim']


" enable pathogen, load private vim packages
execute pathogen#infect()

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands


" editor view
"set number

" In many terminal emulators the mouse works just fine, thus enable it.
"if has('mouse')
"  set mouse=a
"endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" enable modeline parsing
set modeline

" searching
set incsearch
set ignorecase
set smartcase

" Tab-completition menu
set wildmenu
set wildmode=full


" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")


color bdenner

" show whitespace
set listchars=eol:¬,tab:→\ ,trail:․,extends:>,precedes:<
set list

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

set laststatus=2


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif


" Window movements: use Alt + Cursor keys
nnoremap <M-Right> <C-W><Right>
nnoremap <M-Left> <C-W><Left>
nnoremap <M-Up> <C-W><Up>
nnoremap <M-Down> <C-W><Down>

" rotate split windows
nnoremap <M-S-Up> <C-W>R
nnoremap <M-S-Down> <C-W>r
nnoremap <M-S-Right> <C-W><C-R>
nnoremap <M-S-Left> <C-W>R

" inc/dec window sizes with CTRL + Cursor keys
nnoremap <C-Up> <C-W>+
nnoremap <C-Down> <C-W>-
nnoremap <C-Right> <C-W>>
nnoremap <C-Left> <C-W><

" new Windows with Ctrl+Alt + Cursor keys
nnoremap <C-M-Right> <C-W>v
nnoremap <C-M-Left> <C-W>V
nnoremap <C-M-Up> <C-W>n
nnoremap <C-M-Down> <C-W>N

