" Do not lost block selection after indentation. Such a good thing!
vmap > >gv
vmap < <gv

" Make selecting inside an HTML tag less dumb. Thanks to @stevelosh.
nnoremap Vit vitVkoj
nnoremap Vat vatV

" From http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html
vmap * :<C-u>call utils#VSetSearch()<CR>//<CR>
