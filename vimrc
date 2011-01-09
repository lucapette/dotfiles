set nocompatible
set autowrite
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab
set textwidth=78
set hlsearch
set number
set history=50 " keep 50 lines of command line history
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set incsearch " do incremental searching
set wildmenu
set wildignore=*.bak,*.o,*.e,*~
set backup
set backupdir=/tmp
set directory=/tmp
set showmatch
set matchtime=4
set autochdir
set laststatus=2


autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

"FileType settings
autocmd FileType ruby map <silent> <F9> :rubyf %<CR>
autocmd FileType ruby imap <silent> <F9> <Esc> :rubyf %<CR>
autocmd FileType ruby noremap K : !ri <cword><CR>
autocmd BufRead,BufNewFile Rakefile set filetype=ruby
autocmd BufRead,BufNewFile .irbrc set filetype=ruby
autocmd BufRead,BufNewFile .railsrc set filetype=ruby
autocmd BufRead,BufNewFile irbrc set filetype=ruby
autocmd BufRead,BufNewFile railsrc set filetype=ruby
autocmd BufRead,BufNewFile *.html.erb set filetype=html.eruby
autocmd FileType textile map <silent><F7> :TextileRenderTab<CR>
autocmd FileType textile imap <silent><F7> <Esc> :TextileRenderTab<CR>
autocmd FileType snippet set noexpandtab
"git commit message configuration
autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit

"my favourite color scheme
colorscheme desert

syntax on

filetype plugin indent on

filetype plugin plugin on

"Personal command  mapping
map   <silent> <F2> :write<CR>
map   <silent> <F3> :set invnumber<CR>
map   <silent> <F5> gg=G<CR>

imap  <silent> <F2> <Esc> :write<CR>
imap  <silent> <F3> <Esc> :set invnumber<CR>
imap  <silent> <F5> <Esc> gg=G<CR>

"Do not lost block selection after indentation. Such a good thing!
vmap > >gv
vmap < <gv

"Supertab config
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"supertab to <c-space> but backward doesn't work for me
let g:SuperTabMappingForward = '<nul>'
let g:SuperTabMappingBackward = '<s-nul>'
