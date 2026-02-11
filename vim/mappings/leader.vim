" Open CtrlP.vim in buffer-mode search.
nmap <leader>b :CtrlPBuffer<CR>

" Show the diff of current buffer with the git index version.
nmap <leader>d :Gvdiff<CR>

" Open a Tree in the current project directory.
nmap <leader>e :Vexplore<CR>
nmap <leader>E :Vexplore <C-R>=getcwd()<CR><CR>

" Indent all the file with one keystroke.
" See http://lucapette.me/writing/vim-for-rails-developers-indenting-code.
nmap <leader>i gg=G``

" Show a preview of the git current status.
nmap <leader>s :Gstatus<CR>

" Save the current buffer
nmap <leader>w :w<CR>

" Highlight the current word without moving the cursor. Very handy.
nmap <silent> <leader>h :setl hls<CR>:let @/="\\<<C-r><C-w>\\>"<CR>

" Stop highlighting.
nmap <silent> <leader><space> :noh<CR>

