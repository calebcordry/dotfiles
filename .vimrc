"
" Maintainer:	Caleb Cordry <caleb.cordry@gmail.com>
" Last change:	2018 November
"
" ----------------------------------------------------------------------------
"   .vimrc                                                                {{{
" ----------------------------------------------------------------------------

" Allow vim to break compatibility with vi.
set nocompatible " This must be first, because it changes other options.
set termguicolors " Enable truecolors TODO(cc): work out color kinks

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
" Quick settings to be sorted when I learn more.
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
set wrap!

" Enable status bar.
set laststatus=2

" Use wombat colorscheme for lifeline.
" let g:lightline = {'colorscheme': 'wombat'}

set history=200		" keep 200 lines of command line history
set showcmd		    " display incomplete commands
set wildmenu		  " display completion matches in a status line
set cursorline    " highlight the current line.
set ignorecase    " ignore case for searching
set smartcase     " case sensitive search if capital letters are present
set autoread      " reload file when changes detected

" FZF Key mappings
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>
nmap <Leader>a :Ag<Space>
nmap <Leader>r :Rg<Space>
nmap <Leader>H :Helptags!<CR>
nmap <Leader>C :Commands<CR>
nmap <Leader>: :History:<CR>
nmap <Leader>/ :History/<CR>
nmap <Leader>M :Maps<CR>
nmap <Leader>s :Filetypes<CR>

" ALE
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\  '*': ['trim_whitespace']
\}

" Put these lines at the very end of your vimrc file.
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
