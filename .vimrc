"
" Maintainer:	Caleb Cordry <caleb.cordry@gmail.com>
" Last change:	2018 October 
"
" ----------------------------------------------------------------------------
"   .vimrc                                                                {{{
" ----------------------------------------------------------------------------

" TODO(CC): recompile with +clipboard and +termguicolors
" Allow vim to break compatibility with vi.
set nocompatible " This must be first, because it changes other options.
set termguicolors " Enable truecolors, this is not actually doing anything 
" as default mac vim is compiled -clipboard. 

" ----------------------------------------------------------------------------
"   Theme Settings.                                                       {{{
" ----------------------------------------------------------------------------

" Enable syntax highlighting.
syntax enable
    
" Set colorscheme.
let g:gruvbox_italic=1
colorscheme gruvbox

" Enable italicized comments
highlight Comment cterm=italic

" ----------------------------------------------------------------------------
" Caleb's quick settings to be sorted when I learn more.
" ----------------------------------------------------------------------------

" Enable incremental searching.
set incsearch hlsearch

" Add relative numbers to gutter.
set number relativenumber

" Filetype detection.
filetype plugin indent on

" Expand tabs into two spaces.
set tabstop=2 shiftwidth=2 expandtab

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Don't wrap lines.
" set wrap!

" Enable status bar.
set laststatus=2

" Use wombat colorscheme for lifeline.
" let g:lightline = {'colorscheme': 'wombat'}

set history=200		" keep 200 lines of command line history
set showcmd		    " display incomplete commands
set wildmenu		  " display completion matches in a status line
set cursorline    " highlight the current line.

