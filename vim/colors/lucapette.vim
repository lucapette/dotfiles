" Based on: Clayton Parker (cterm colors)

" =============================================================================
"  Initialization and Setup {{{1
" =============================================================================

set background=light

highlight clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "lucapette"
" }}}

"  Highlight Groups {{{1
" =============================================================================
" Groups (see ':help highlight-groups'):
"    ColorColumn     highlight to use with ':set colorcolumn'
"    Cursor          the character under the cursor
"    CursorIM        like Cursor, but used when in IME mode |CursorIM|
"    CursorColumn    the screen column that the cursor is in when 'cursorcolumn' is set
"    CursorLine      the screen line that the cursor is in when 'cursorline' is set
"    Directory       directory names (and other special names in listings)
"    DiffAdd         diff mode: Added line |diff.txt|
"    DiffChange      diff mode: Changed line |diff.txt|
"    DiffDelete      diff mode: Deleted line |diff.txt|
"    DiffText        diff mode: Changed text within a changed line |diff.txt|
"    ErrorMsg        error messages on the command line
"    VertSplit       the column separating vertically split windows
"    Folded          line used for closed folds
"    FoldColumn      'foldcolumn'
"    SignColumn      column where |signs| are displayed
"    IncSearch       'incsearch' highlighting; also used for the text replaced with ":s///c"
"    LineNr          Line number for ":number" and ":#" commands, and when 'number' option is set.
"    MatchParen      The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
"    ModeMsg         'showmode' message (e.g., "-- INSERT --")
"    MoreMsg         |more-prompt|
"    NonText         '~' and '@' at the end of the window, etc.
"    Normal          normal text
"    Pmenu           Popup menu: normal item.
"    PmenuSel        Popup menu: selected item.
"    PmenuSbar       Popup menu: scrollbar.
"    PmenuThumb      Popup menu: Thumb of the scrollbar.
"    Question        |hit-enter| prompt and yes/no questions
"    Search          Last search pattern highlighting (see 'hlsearch').
"    SpecialKey      Meta and special keys listed with ":map", text that is displayed differently from what it really is (such as tabs, spaces in listchars etc.).
"    SpellBad        Word that is not recognized by the spellchecker. |spell|
"    SpellCap        Word that should start with a capital. |spell|
"    SpellLocal      Word that is recognized by the spellchecker as one that is
"    SpellRare       Word that is recognized by the spellchecker as one that is hardly ever used. |spell|
"    StatusLine      status line of current window
"    StatusLineNC    status lines of not-current windows
"    TabLine         tab pages line, not active tab page label
"    TabLineFill     tab pages line, where there are no labels
"    TabLineSel      tab pages line, active tab page label
"    Title           titles for output from ":set all", ":autocmd" etc.
"    Visual          Visual mode selection
"    VisualNOS       Visual mode selection when vim is "Not Owning the Selection".
"    WarningMsg      warning messages
"    WildMenu        current match in 'wildmenu' completion

" 256-Color Terminal Colors
" =============================================================================
hi Boolean      ctermfg=88
hi Comment      ctermfg=4
hi Constant     ctermfg=208
hi Cursor       ctermfg=255             ctermbg=16              cterm=NONE
hi CursorColumn ctermfg=NONE            ctermbg=255             cterm=NONE
hi CursorIM     ctermfg=255             ctermbg=16              cterm=NONE
hi CursorLine   ctermfg=NONE            ctermbg=254             cterm=NONE
hi DiffAdd      ctermfg=16              ctermbg=48              cterm=NONE
hi DiffChange   ctermfg=16              ctermbg=153             cterm=NONE
hi DiffDelete   ctermfg=16              ctermbg=203             cterm=NONE
hi DiffText     ctermfg=16              ctermbg=226             cterm=NONE
hi Directory    ctermfg=21              ctermbg=255             cterm=NONE
hi Error        ctermfg=196             ctermbg=255             cterm=NONE
hi ErrorMsg     ctermfg=160             ctermbg=NONE            cterm=NONE
hi FoldColumn   ctermfg=24              ctermbg=252             cterm=NONE
hi Folded       ctermfg=24              ctermbg=252             cterm=NONE
hi Function     ctermfg=136
hi Identifier   ctermfg=160
hi Ignore       ctermfg=255
hi IncSearch    ctermfg=255             ctermbg=160             cterm=NONE
hi Keyword      ctermfg=45
hi LineNr       ctermfg=253             ctermbg=110             cterm=NONE
hi NonText      ctermfg=110             ctermbg=255             cterm=NONE
hi Normal       ctermfg=17              ctermbg=255             cterm=NONE 
hi Pmenu        ctermfg=fg              ctermbg=195             cterm=NONE
hi PmenuSbar    ctermfg=255             ctermbg=153             cterm=NONE
hi PmenuSel     ctermfg=255             ctermbg=21              cterm=NONE
hi PmenuThumb   ctermfg=111             ctermbg=255             cterm=NONE
hi PreProc      ctermfg=26
hi Search       ctermfg=255             ctermbg=160             cterm=NONE
hi SignColumn   ctermfg=110             ctermbg=254             cterm=NONE
hi Special      ctermfg=64
hi SpecialKey   ctermfg=255             ctermbg=144             cterm=NONE
hi SpellBad     ctermfg=16              ctermbg=229             cterm=NONE
hi SpellCap     ctermfg=16              ctermbg=231             cterm=NONE
hi SpellLocal   ctermfg=16              ctermbg=231             cterm=NONE
hi SpellRare    ctermfg=16              ctermbg=226             cterm=NONE
hi Statement    ctermfg=21
hi StatusLine   ctermfg=255             ctermbg=24              cterm=NONE
hi StatusLineNC ctermfg=253             ctermbg=110             cterm=NONE
hi String       ctermfg=30
hi Title        ctermfg=75              ctermbg=255             cterm=NONE
hi Todo         ctermfg=136             ctermbg=255             cterm=NONE
hi Type         ctermfg=28
hi VertSplit    ctermfg=255             ctermbg=24              cterm=NONE
hi VimCommentTitle  ctermfg=110
hi VimError     ctermfg=160             ctermbg=16
hi Visual       ctermfg=255             ctermbg=153             cterm=NONE
hi WildMenu     ctermfg=16              ctermbg=117             cterm=NONE

"HTML
hi htmlTag ctermfg=136
hi htmlEndTag ctermfg=136
hi htmlItalic cterm=NONE
hi link htmlLink NONE
hi link htmlItalic NONE
hi htmlLink ctermfg=208

"XML
hi xmlTag ctermfg=136
hi xmlEndTag ctermfg=136
