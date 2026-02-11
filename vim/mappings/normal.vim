" While searching scroll to the center of the window.
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" Make Y consistent with C and D.  See :help Y.
nnoremap Y y$

" splitjoin.vim mappings
nmap sj :SplitjoinSplit<CR>
nmap sk :SplitjoinJoin<CR>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

nmap =j :%!python -m json.tool<CR>
