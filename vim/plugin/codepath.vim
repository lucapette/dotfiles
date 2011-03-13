" ============================================================================
" File:        codepath.vim
" Description: This plugin provides a function to get a root project
"              directory based on a given directory.
"              It has other features, see
"              https://github.com/lucapette/codepath.vim.
"
" Maintainer:  Luca Pette <lucapette@gmail.com>
" Last Change: 26 January, 2011
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" ============================================================================

if exists("loaded_codepath")
    finish
endif

if has("ruby") < 1
    echoerr "codepath: it requires +ruby feature"
    finish
endif

if !exists("g:codepath")
    let g:codepath = $HOME."/code"
endif

if !exists("g:codepath_tags_file")
        let g:codepath_tags = "tags"
endif

let loadedcode_path = 1

" stolen from rails.vim
function! s:pathjoin(...) abort
  let i = 0
  let path = ""
  while i < a:0
    if type(a:000[i]) == type([])
      let list = a:000[i]
      let j = 0
      while j < len(list)
        let escaped = substitute(list[j],'[\\, ]','\\&','g')
        if exists("+shellslash") && !&shellslash
          let escaped = substitute(escaped,'^\(\w:\\\)\\','\1','')
        endif
        let path .= ',' . escaped
        let j += 1
      endwhile
    else
      let path .= "," . a:000[i]
    endif
    let i += 1
  endwhile
  return substitute(path,'^,','','')
endfunction

ruby << RUBY
require "#{ENV['HOME']}/.vim/ruby/codepath"
def codepath
   @codepath ||= CodePath.new(VIM.evaluate("g:codepath"))
end
RUBY

function! CodePath()
    let roots = []
    ruby << RUBY
    result=codepath.codedir(VIM.evaluate("getcwd()"))
    VIM.evaluate("add(roots,\"#{result}\")")
RUBY
    return get(roots,0)
endfunction

if exists("g:codepath_add_to_path")
    let path_dirs = []
    ruby << RUBY
    current_dir = VIM.evaluate("getcwd()")
    if codepath.codedir?(current_dir)
        for dir in codepath.subdirs(VIM.evaluate("CodePath()"))
           VIM.evaluate("add(path_dirs,\"#{dir}\")")
        end
    end
RUBY
    let &path = &path . s:pathjoin(path_dirs)
endif

if exists("g:codepath_add_to_tags")
    let &tags = &tags . "," . CodePath(). "/tags"
endif
