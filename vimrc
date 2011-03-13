set autochdir
set autoindent
set autowrite
set backspace=indent,eol,start
set backup
set backupdir=/tmp
set completeopt=longest,menuone
set dictionary=/usr/share/dict/words
set directory=/tmp
set expandtab
set gdefault
set grepprg=ack
set history=50
set hlsearch
set incsearch
set laststatus=2
set matchtime=4
set nocompatible
set nofoldenable
set number
set numberwidth=1
set pastetoggle=<F12>
set ruler
set shell=/bin/bash\ -i
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set spelllang=en_gb
set splitright
set tabstop=4
set term=gnome-256color
set textwidth=78
set wildignore=*.bak,*.o,*.e,*~
set wildmenu

set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]%=\ [%p%%]\ [%L]

" I don't remember where I stole the initial colour scheme.
" Furthermore I don't like the name.
colorscheme lucapette

syntax on

filetype plugin indent on

filetype plugin plugin on

autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

"Personal command  mapping
map   <silent> <F2> :write<CR>
map   <silent> <F3> :set invnumber<CR>
map   <silent> <F5> gg=G<CR>
map   <silent> <F9> :set spell!<CR>
map   <silent> <C-T> :FuzzyFinderTextMate<CR>
map  <C-N> :cn<CR>
map  <C-P> :cp<CR>
map " ci"

imap  <silent> <F2> <Esc> :write<CR>
imap  <silent> <F3> <Esc> :set invnumber<CR>
imap  <silent> <F5> <Esc> gg=G<CR>
imap  <silent> <F9> <Esc> :set spell!<CR>
imap  <silent> <C-T> <Esc> :FuzzyFinderTextMate<CR>

nnoremap <silent> <F4> :NERDTreeToggle `=CodePath()`<cr>
inoremap <silent> <F4> <Esc>:NERDTreeToggle `=CodePath()` <cr>

" select all plus yank all plus cut all
nmap <C-A> ggVG
nmap <C-Y> <c-a>y
nmap <C-X> <c-a>x

"Do not lost block selection after indentation. Such a good thing!
vmap > >gv
vmap < <gv

"Code completion with ctrl-space
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

"NERDTree plugin config
let g:NERDTreeHijackNetrw = 1

"codepath.vim config
let g:codepath_add_to_tags = 1
let g:codepath_add_to_path = 1

"FuzzyFinderTextMate Config
autocmd User Rails let g:fuzzy_ignore = 'tmp/**/*,*.png,*.jpg'
let g:fuzzy_path_display = 'highlighted_path'
