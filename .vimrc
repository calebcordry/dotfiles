" Maintainer:	Caleb Cordry <caleb.cordry@gmail.com>
" Last change:	2018 November
"
" ----------------------------------------------------------------------------
"   .vimrc
" ----------------------------------------------------------------------------
" Allow vim to break compatibility with vi.
set nocompatible " This must be first, because it changes other options.

" ----------------------------------------------------------------------------
"   Theme Settings
" ----------------------------------------------------------------------------
set termguicolors

" Some sort of hack to enable truecolor
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

" Enable syntax highlighting.
syntax enable

" Filetype detection.
filetype plugin indent on

" Set colorscheme.
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

" Enable italicized comments
highlight Comment cterm=italic

" Change color of search results
" hi Search guibg=LightBlue

" Use wombat colorscheme for lifeline.
" let g:lightline = {'colorscheme': 'wombat'}

" ----------------------------------------------------------------------------
"   Basic Settings
" ----------------------------------------------------------------------------
" Enable incremental searching.
set incsearch hlsearch
" Add relative numbers to gutter.
set number relativenumber
" Expand tabs into two spaces.
set tabstop=2 shiftwidth=2 expandtab
" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set wrap!                     " Don't wrap lines.
set laststatus=2              " Enable status bar.
set history=200               " keep 200 lines of command line history
set showcmd                   " display incomplete commands
set wildmenu                  " display completion matches in a status line
set wildmode=list:longest     " complete until longest match and list possibilities
set cursorline                " highlight the current line.
set ignorecase                " ignore case for searching
set smartcase                 " case sensitive search if capital letters are present
set autoread                  " reload file when changes detected
set directory=~/tmp           " save all swap files in one place
set hidden                    " allow buffers to be hidden
set shiftround                " round indent to multiples of shiftwidth
set scrolloff=3               " keep a few lines on screen before cursor
set autoindent                " smart indentation
set ttyfast                   " faster redrawing
set showmatch                 " briefly show matching char
set gdefault                  " replace globally
set noswapfile                " annoying
set ttimeoutlen=50            " make switching modes faster

" ----------------------------------------------------------------------------
"   Mappings
" ----------------------------------------------------------------------------
" Move current line up
noremap - ddp
" Move current line down
noremap _ ddkP
" Uppercase word in visual mode
inoremap <c-u> <esc>lviwUi
" Save
noremap <Leader>s :update<CR>
" Make window switching easier
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>
" Toggle comments
noremap <silent> <leader>c :Commentary<CR>

let maplocalleader = "\\"
" Easy vimrc editing
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" Surround word with quotes
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
" Turn off highlight
nnoremap <leader>h :nohl<CR>

" ----------------------------------------------------------------------------
"   Auto Commands
" ----------------------------------------------------------------------------
" Vimscript file settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" ----------------------------------------------------------------------------
" Quickfix
"  ----------------------------------------------------------------------------
nnoremap ]q :cnext<cr>zz
nnoremap [q :cprev<cr>zz
nnoremap ]l :lnext<cr>zz
nnoremap [l :lprev<cr>zz

" ----------------------------------------------------------------------------
"   FZF Settings
" ----------------------------------------------------------------------------
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
" nmap <Leader>s :Filetypes<CR>

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

"   \ call fzf#vim#ag(<q-args>,
"   \                 <bang>0 ? fzf#vim#with_preview('up:60%')
"   \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \                 <bang>0)

" ----------------------------------------------------------------------------
"   ALE Settings
" ----------------------------------------------------------------------------
hi link ALEErrorSign    GruvboxRed
hi link ALEWarningSign  GruvboxYellow

let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_linters = {'javascript': ['tsserver', 'eslint']}
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace']
\}

noremap <Leader>ad :ALEGoToDefinition<CR>
noremap <Leader>af :ALEFix<CR>
noremap <Leader>ar :ALEFindReferences<CR>

autocmd FileType JAVASCRIPT nmap <buffer> <C-]> :ALEGoToDefinition<CR>
nnoremap ]a <Plug>(ale_next_wrap)
nnoremap [a <Plug>(ale_previous_wrap)

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" ----------------------------------------------------------------------------
"   End
" ----------------------------------------------------------------------------
" Keep this at end of file
" Load all helptags after all plugins have been loaded
silent! helptags ALL
