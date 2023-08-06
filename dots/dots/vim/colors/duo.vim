" Project: Duo Mini Vim
" Repository: https://github.com/seesleestak/duo-mini
" License: MIT

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "duo-mini"
set background=dark

"Default colors
let s:bg        = { "gui": "NONE", "cterm": "NONE" }  " Background color:normal
let s:fg        = { "gui": "NONE", "cterm": "7" }     " NormalText:color08:normal + Keywords:color08:intense
let s:primary   = { "gui": "NONE", "cterm": "6" }     " None keyword accent:color07:normal
let s:subtle    = { "gui": "NONE", "cterm": "8" }     " Comments:color01:intense
let s:selection = { "gui": "NONE", "cterm": "0" }     " Visual selection color
let s:red       = { "gui": "NONE", "cterm": "1" }
let s:yellow    = { "gui": "NONE", "cterm": "3" }
let s:green     = { "gui": "NONE", "cterm": "2" }




if exists("g:duo_mini_bg")
  let s:bg = { "gui": g:duo_mini_bg, "cterm": "0" }
endif

if exists("g:duo_mini_fg")
  let s:fg = { "gui": g:duo_mini_fg, "cterm": "7" }
endif

if exists("g:duo_mini_primary")
  let s:primary = { "gui": g:duo_mini_primary, "cterm": "2" }
endif

if exists("g:duo_mini_subtle")
  let s:subtle = { "gui": g:duo_mini_subtle, "cterm": "8" }
endif

if exists("g:duo_mini_selection")
  let s:selection = { "gui": g:duo_mini_selection, "cterm": "0" }
endif

if exists("g:duo_mini_red")
  let s:red = { "gui": g:duo_mini_red, "cterm": "1" }
endif

if exists("g:duo_mini_yellow")
  let s:yellow = { "gui": g:duo_mini_yellow, "cterm": "3" }
endif

if exists("g:duo_mini_green")
  let s:green = { "gui": g:duo_mini_green, "cterm": "2" }
endif

let s:bold = "bold,"
let s:italic = "italic,"
let s:underline = "underline,"
let s:reverse= "reverse,"

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

call s:h("Normal",        {"bg": s:bg, "fg": s:fg})
call s:h("Noise",        {"bg": s:bg, "fg": s:fg})
call s:h("Cursor",        {"bg": s:green, "fg": s:fg})
call s:h("Comment",       {"fg": s:subtle, "cterm": s:italic})
call s:h("Function",      {"fg": s:fg})
call s:h("Statement",     {"bg": s:bg, "fg": s:fg, "cterm": s:bold})
call s:h("Constant",      {"bg": s:bg, "fg": s:primary})

hi! link Character        Constant
hi! link Number           Constant
hi! link Boolean          Constant
hi! link Float            Constant
hi! link String           Constant
hi! link Conditonal       Normal
hi! link Repeat           Normal
hi! link Label            Normal
hi! link Operator         Noise
hi! link Keyword          Statement
hi! link Exception        Statement
hi! link PreProc          Normal
hi! link Identifier       Normal
hi! link Include          Statement
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc
hi! link Type             Normal
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type
hi! link Special          Normal
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special
hi! link Conceal          NonText

call s:h("Underlined",    {"fg": s:fg, "gui": "underline", "cterm": s:underline})
call s:h("Ignore",        {"fg": s:bg})
call s:h("Error",         {"fg": s:red, "bg": s:bg, "cterm": s:bold})
call s:h("Todo",          {"fg": s:yellow, "gui": s:bold, "cterm": s:bold})
call s:h("SpecialKey",    {"fg": s:subtle})
call s:h("NonText",       {"fg": s:subtle})
call s:h("Directory",     {"fg": s:primary})
call s:h("ErrorMsg",      {"fg": s:red})
call s:h("IncSearch",        {"cterm": s:reverse})
call s:h("CurSearch",        {"cterm": s:reverse})
call s:h("Search",        {"cterm": s:reverse})
call s:h("MoreMsg",       {"fg": s:fg, "cterm": s:bold, "gui": s:bold})
hi! link ModeMsg MoreMsg
call s:h("LineNr",        {"fg": s:subtle})
call s:h("CursorLineNr",  {"fg": s:fg, "bg": s:bg})
call s:h("Question",      {"fg": s:red})
call s:h("VertSplit",     {"bg": s:bg, "fg": s:subtle})
call s:h("Title",         {"fg": s:fg})
call s:h("Visual",        {"bg": s:selection})
" VisualNOS
" Visual mode selection when vim is 'Not Owning the Selection'.
" Only X11 Gui's gui-x11 and xterm-clipboard supports this.
call s:h("VisualNOS",     {"bg": s:subtle})
call s:h("WarningMsg",    {"fg": s:yellow})
call s:h("WildMenu",      {"fg": s:fg, "bg": s:bg})
call s:h("Folded",        {"fg": s:subtle})
call s:h("FoldColumn",    {"fg": s:subtle})
call s:h("DiffAdd",       {"fg": s:green})
call s:h("DiffDelete",    {"fg": s:red})
call s:h("DiffChange",    {"fg": s:yellow})
call s:h("DiffText",      {"fg": s:green})
call s:h("SignColumn",    {"fg": s:green})

call s:h("SpellBad",    {"cterm": s:underline, "fg": s:red})
call s:h("SpellCap",    {"cterm": s:underline, "fg": s:primary})
call s:h("SpellRare",   {"cterm": s:underline, "fg": s:primary})
call s:h("SpellLocal",  {"cterm": s:underline, "fg": s:green})

""" Help
hi link helpHyperTextEntry Title
hi link helpHyperTextJump  String

""" StatusLine
call s:h("StatusLine",        {"bg": s:primary, "fg": s:bg})
call s:h("StatusLineNC",      {"cterm": s:underline, "bg": s:bg, "fg": s:fg})
call s:h("StatusLineOk",      {"gui": s:underline, "bg": s:bg, "fg": s:green})
call s:h("StatusLineError",   {"gui": s:underline, "bg": s:bg, "fg": s:red})
call s:h("StatusLineWarning", {"gui": s:underline, "bg": s:bg, "fg": s:yellow})

call s:h("Pmenu",         {"fg": s:fg, "bg": s:selection})
call s:h("PmenuSel",      {"fg": s:bg, "bg": s:primary, "gui": s:bold})
call s:h("PmenuSbar",     {"fg": s:fg, "bg": s:subtle})
call s:h("PmenuThumb",    {"fg": s:fg, "bg": s:subtle})
call s:h("TabLine",       {"fg": s:fg, "bg": s:primary})
call s:h("TabLineSel",    {"fg": s:fg, "bg": s:bg, "gui": s:bold, "cterm": s:bold})
call s:h("TabLineFill",   {"fg": s:fg, "bg": s:primary})
call s:h("CursorColumn",  {"bg": s:subtle})
call s:h("CursorLine",    {"bg": s:bg})
call s:h("ColorColumn",   {"bg": s:subtle})

call s:h("MatchParen",    {"bg": s:selection, "fg": s:fg})
call s:h("qfLineNr",      {"fg": s:subtle})

hi! link diffRemoved       DiffDelete
hi! link diffAdded         DiffAdd

" JS
hi! link jsFlowTypeKeyword Statement
hi! link jsFlowImportType Statement
hi! link jsFunction Statement
hi! link jsGlobalObjects Normal
hi! link jsGlobalNodeObjects Normal
hi! link jsArrowFunction Noise
hi! link StorageClass Statement

" XML
call s:h("xmlTag", {"bg": s:bg, "fg": s:primary})
hi! link xmlTagName xmlTag
hi! link xmlEndTag xmlTag
hi! link xmlAttrib xmlTag

" Markdown
hi! link markdownH1 Statement
hi! link markdownH2 Statement
hi! link markdownH3 Statement
hi! link markdownH4 Statement
hi! link markdownH5 Statement
hi! link markdownH6 Statement
hi! link markdownListMarker Constant
hi! link markdownCode Constant
hi! link markdownCodeBlock Constant
hi! link markdownCodeDelimiter Constant
hi! link markdownHeadingDelimiter Constant
hi! link markdownUrl Constant

call s:h("htmlArg", { "fg": s:fg })
call s:h("htmlLink", { "fg": s:fg, "cterm": "NONE" })
call s:h("htmlItalic", { "cterm": s:italic })
hi! link htmlTag xmlTag
hi! link htmlEndTag xmlEndTag
hi! link htmlTagN htmlTag
hi! link htmlH1 Normal
hi! link htmlH2 Normal
hi! link htmlH3 Normal
hi! link htmlH4 Normal
hi! link htmlH5 Normal
hi! link htmlH6 Normal
hi! link htmlSpecialChar Special
