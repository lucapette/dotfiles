" ============================================================================
" File:        codepath.vim
" Description: This plugin provides a little function to get a root project
"              directory based on a given directory.
"              I use it for setting fuzzy_finder roots and NERDTreeToggle.
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

if exists("loaded_code_path")
    finish
endif

if has("ruby") < 1
    echoerr "codepath: it requires +ruby feature"
    finish
endif

if !exists("g:code_path")
    let g:code_path = $HOME."/code"
end

let loaded_code_path = 1

ruby << RUBY
def codepath(code_dir)
    current_dir = VIM.evaluate("getcwd()")
    if current_dir.include?(code_dir)
        current_dir[/#{code_dir}/]=""
        "#{code_dir}/#{current_dir.match(/^\/([^\/]+)/)[1]}"
    else
        current_dir
    end
end
RUBY

function CodePath()
    let roots = []
    ruby << RUBY
    result=codepath(VIM.evaluate("g:code_path"))
    VIM.evaluate("add(roots,\"#{result}\")")
RUBY
    return get(roots,0)
endfunction
