set nocompatible
set autowrite
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab
set textwidth=78
set incsearch
set hlsearch
set number
set history=50
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set wildmenu
set wildignore=*.bak,*.o,*.e,*~
set backup
set backupdir=/tmp
set directory=/tmp
set showmatch
set matchtime=4
set autochdir
set laststatus=2
set completeopt=longest,menuone
set nofoldenable
set spelllang=en_gb
set term=gnome-256color
colorscheme mayansmoke

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

imap  <silent> <F2> <Esc> :write<CR>
imap  <silent> <F3> <Esc> :set invnumber<CR>
imap  <silent> <F5> <Esc> gg=G<CR>
imap  <silent> <F9> <Esc> :set spell!<CR>

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

nnoremap <silent> <F4> :NERDTreeToggle <cr>
inoremap <silent> <F4> <Esc>:NERDTreeToggle <cr>

autocmd User Rails  nnoremap <silent> <F4> :Rtree <cr>
autocmd User Rails  inoremap <silent> <F4> <Esc>:Rtree <cr>
