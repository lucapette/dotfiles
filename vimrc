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
"always cd to current's file directory
set autochdir

autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit

autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

"ruby settings
"set tags=$HOME/.vim/tags/rails
autocmd BufnewFile *.rb 0r ~/.vim/skeleton.rb
autocmd FileType ruby map <silent> <F9> :rubyf %<CR>
autocmd FileType ruby noremap K : !ri <cword><CR>
autocmd BufRead,BufNewFile Rakefile set filetype=ruby
autocmd BufRead,BufNewFile .irbrc set filetype=ruby
autocmd BufRead,BufNewFile .railsrc set filetype=ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

"my favourite color scheme
colorscheme desert

syntax on

filetype plugin indent on

filetype plugin plugin on

"Personal command  mapping
map   <silent> <F2>    :write<CR>
map   <silent> <F6>    :copen<CR>
map   <silent> <F7>    :cp<CR>
map   <silent> <F8>    :cn<CR>

imap  <silent> <F2>    <Esc>:write<CR>
imap  <silent> <F6>    <Esc>:copen<CR>
imap  <silent> <F7>    <Esc>:cp<CR>
imap  <silent> <F8>    <Esc>:cn<CR>


"Supertab configuration
let g:SuperTabMappingForward = '<c-space>' 
let g:SuperTabMappingBackward = '<s-c-space>'
let g:SuperTabContextDefaultCompletionType = "<c-o>"
