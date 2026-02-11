if exists("g:loaded_utils")
  finish
endif

let g:loaded_utils = 1

" Trimspaces without messing with the search register.
func! utils#trimspaces()
  let oldsearch = @/
  let oldhlsearch = &hlsearch
  %s/\s\+$//e
  let @/ = oldsearch
  let &hlsearch = oldhlsearch
endfunc

" From http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html
func! utils#VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '\'), '\n', '\\n', 'g')
  let @s = temp
endfunc

" Run commands in vimux. I'm wrapping it because I want to handle the case in
" which tmux isn't running and use !
func utils#RunCommand(cmd)
  call VimuxRunCommand(a:cmd)
endfunc

" vim:set et sw=2:
