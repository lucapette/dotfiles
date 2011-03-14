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
    ruby << RUBY
    current_dir = VIM.evaluate("getcwd()")
    if codepath.codedir?(current_dir)
        subdirs_path=codepath.subdirs(VIM.evaluate("CodePath()"))
        VIM.set_option("path+=#{subdirs_path}")
    end
RUBY
endif

if exists("g:codepath_add_to_tags")
    let &tags = &tags . "," . CodePath(). "/tags"
endif
