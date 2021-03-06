" Bdenner vimrc file
"
" Based on vimrc_example.vim
"
"
" pathogen
" To disable a plugin, add it's bundle name to the following list
"let g:pathogen_blacklist = ['vim-airline']
"let g:pathogen_blacklist = ['lightline.vim', 'vim-latex']

" enable pathogen, load private vim packages
"execute pathogen#infect()

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


" vundle stuff
filetype off		" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Language and file type support:
Plugin 'vim-ruby/vim-ruby'
Plugin 'derekwyatt/vim-scala'
Plugin 'lervag/vimtex'
Plugin 'robbles/logstash.vim'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'stephpy/vim-yaml'
"
" Checking:
Plugin 'vim-syntastic/syntastic'     " syntax checking for many languages
Plugin 'vim-scripts/SyntaxAttr.vim'  " show syntax error for current position
Plugin 'dpelle/vim-LanguageTool'     " LanguageTool grammar checker
Plugin 'bronson/vim-trailing-whitespace'  " show exactly that
"
" Productivity:
Plugin 'tpope/vim-endwise'    " add closing tags (e.g. Ruby 'end')
Plugin 'tpope/vim-fugitive'   " Git wrapper for vim
Plugin 'tpope/vim-surround'   " add/manipulate surroundings (add ...)
Plugin 'tmhedberg/matchit'    " extend the power of the '%' command
Plugin 'ervandew/supertab'    " completion with <Tab> only
Plugin 'tComment'             " comment/uncomment lang aware

Plugin 'scrooloose/nerdtree'  " file browser
Plugin 'Xuyuanp/nerdtree-git-plugin'  " show Git status of files in NERDTree

" Visual stuff:
Plugin 'vim-airline/vim-airline'        " status line
Plugin 'vim-airline/vim-airline-themes' " themes for airline
Plugin 'airblade/vim-gitgutter'         " show changes for file in Git


" Misc:
Plugin 'guns/xterm-color-table.vim'  " test Truecolor possibility of terminal
Plugin 'tpope/vim-repeat'            " add repeat functionality for plugins

Plugin 'jamessan/vim-gnupg'          " natively read/write encrypted files


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

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

  " For all text files set 'textwidth' to 80 characters.
  autocmd FileType text setlocal textwidth=80
  autocmd FileType tex setlocal textwidth=80
  autocmd FileType md setlocal textwidth=80

  " format options, for details see :help fo-table
  " automatic paragaph formating (hard wrapping) and handle lists
  autocmd FileType text setlocal fo+=anw
  autocmd FileType tex setlocal fo+=anw
  autocmd FileType md setlocal fo+=anw

  " disable vim-airline whitspace checks for LaTeX file, otherwise I will
  " check all tex file all the time for bad whitespaces ;)
  autocmd FileType tex let b:airline_whitespace_disabled = 1

  " ignore certain lacheck messages
  let g:syntastic_tex_lacheck_quiet_messages={ 'regex': '\Vpossible unwanted space at "{"' }

  " always show line on column 80
  set colorcolumn=+1

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

" enable powerline fonts
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" space as space symbol
let g:airline_symbols.space = "\ua0"

" always show file status line
set laststatus=2

" map <CTRL>-n to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" LanguageTool Grammar checker
"
" install LanguageTool (https://www.languagetool.org/) on /opt/LanguageTool
" and use it with
" :LanguageToolCheck
" :LanguageToolClear
"
" install helptags: vim -c 'helptags ~/.vim/bundles/vim-LanugageTool/doc'
let g:languagetool_jar='/opt/LanguageTool/languagetool-commandline.jar'


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


" Ruby specifics
" Omni complete features of vim-ruby -> see :help ft-ruby-omni
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_load_gemfile = 1


" vim-gnupg
" use gpg2 only
let g:GPGExecutable = "gpg2"
let g:GPGDefaultRecipients = ["Bernhard Denner <bernhard.denner@gmail.com"]
