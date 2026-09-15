" Vim color scheme
" Name:         1337.vim
" Ported from:  1337 Sublime Text theme by Mark Herpich
" License:      MIT (see fileDump/LICENSE for the original theme)

hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "1337"
set background=dark

let s:bg          = ['#000000', 'NONE']
let s:fg           = ['#F8F8F2', 255]
let s:caret        = ['#F8F8F0', 255]
let s:invisibles   = ['#3B3A32', 237]
let s:line_hl      = ['#3D3D3D', 237]
let s:selection    = ['#515151', 239]
let s:comment      = ['#6d6d6d', 242]
let s:string       = ['#fbe3bf', 223]
let s:number       = ['#fdb082', 216]
let s:const_lang   = ['#ff8942', 209]
let s:variable     = ['#e9fdac', 193]
let s:keyword      = ['#ff5e5e', 203]
let s:storage_type = ['#fbdfb5', 223]
let s:class_name   = ['#8cdaff', 117]
let s:func_name    = ['#8cdaff', 117]
let s:func_param   = ['#fc9354', 209]
let s:tag          = ['#ff5e5e', 203]
let s:attribute    = ['#97d8ea', 116]
let s:sup_function = ['#6699cc', 68]
let s:sup_constant = ['#ecfdb9', 229]
let s:sup_type     = ['#fbe3bf', 223]
let s:punctuation  = ['#ffffff', 15]
let s:text         = ['#d0d0d0', 252]
let s:attr_id      = ['#66a9ec', 75]
let s:lang_literal = ['#d699ff', 177]
let s:git_added    = ['#A6E22E', 148]
let s:git_changed  = ['#CC00FF', 165]
let s:git_deleted  = ['#F92672', 197]
let s:invalid_bg   = ['#f92649', 197]
let s:deprecated_bg= ['#ff9664', 209]
let s:diff_header  = ['#75715E', 242]
let s:white        = ['#ffffff', 15]
let s:black        = ['#000000', 0]
let s:statusline_bg= ['#2d2d2d', 236]
let s:pmenu_bg     = ['#262626', 235]
let s:pmenu_sel_bg = ['#3d3d3d', 237]
let s:linenr_fg    = ['#5a5a5a', 240]
let s:vertsplit_fg = ['#3B3A32', 237]

function! s:Hi(group, fg, bg, ...)
    let l:cmd = 'hi ' . a:group
    if !empty(a:fg)
        let l:cmd .= ' guifg=' . a:fg[0] . ' ctermfg=' . a:fg[1]
    else
        let l:cmd .= ' guifg=NONE ctermfg=NONE'
    endif
    if !empty(a:bg)
        let l:cmd .= ' guibg=' . a:bg[0] . ' ctermbg=' . a:bg[1]
    else
        let l:cmd .= ' guibg=NONE ctermbg=NONE'
    endif
    let l:attr = a:0 > 0 ? a:1 : 'NONE'
    let l:cmd .= ' gui=' . l:attr . ' cterm=' . l:attr
    execute l:cmd
endfunction

call s:Hi('Normal',       s:fg, s:bg)
call s:Hi('Cursor',       s:bg, s:caret)
call s:Hi('CursorLine',   [], s:line_hl)
call s:Hi('CursorLineNr', s:fg, s:line_hl, 'bold')
call s:Hi('CursorColumn', [], s:line_hl)
call s:Hi('LineNr',       s:linenr_fg, s:bg)
call s:Hi('SignColumn',   s:linenr_fg, s:bg)
call s:Hi('Visual',       [], s:selection)
call s:Hi('VisualNOS',    [], s:selection)
call s:Hi('StatusLine',   s:fg, s:statusline_bg, 'bold')
call s:Hi('StatusLineNC', s:comment, s:statusline_bg)
call s:Hi('VertSplit',    s:vertsplit_fg, s:bg)
call s:Hi('TabLine',      s:comment, s:statusline_bg)
call s:Hi('TabLineFill',  [], s:statusline_bg)
call s:Hi('TabLineSel',   s:fg, s:bg, 'bold')
call s:Hi('Pmenu',        s:fg, s:pmenu_bg)
call s:Hi('PmenuSel',     s:bg, s:attribute)
call s:Hi('PmenuSbar',    [], s:pmenu_sel_bg)
call s:Hi('PmenuThumb',   [], s:comment)
call s:Hi('Search',       s:bg, s:number)
call s:Hi('IncSearch',    s:bg, s:keyword)
call s:Hi('MatchParen',   s:bg, s:attribute, 'bold')
call s:Hi('NonText',      s:invisibles, s:bg)
call s:Hi('SpecialKey',   s:invisibles, s:bg)
call s:Hi('Folded',       s:comment, s:statusline_bg)
call s:Hi('FoldColumn',   s:comment, s:bg)
call s:Hi('ColorColumn',  [], s:line_hl)
call s:Hi('WildMenu',     s:bg, s:number)
call s:Hi('Directory',    s:attribute, [])
call s:Hi('Title',        s:class_name, [], 'bold')
call s:Hi('SpellBad',     s:keyword, [], 'undercurl')
call s:Hi('SpellCap',     s:attribute, [], 'undercurl')
call s:Hi('SpellRare',    s:lang_literal, [], 'undercurl')
call s:Hi('SpellLocal',   s:sup_constant, [], 'undercurl')
call s:Hi('ErrorMsg',     s:white, s:invalid_bg, 'bold')
call s:Hi('WarningMsg',   s:deprecated_bg, [])
call s:Hi('ModeMsg',      s:fg, [])
call s:Hi('MoreMsg',      s:git_added, [])
call s:Hi('Question',     s:git_added, [])

call s:Hi('Comment',     s:comment, [], 'italic')

call s:Hi('Constant',    s:number, [])
call s:Hi('String',      s:string, [])
call s:Hi('Character',   s:sup_type, [])
call s:Hi('Number',      s:number, [])
call s:Hi('Boolean',     s:const_lang, [])
call s:Hi('Float',       s:number, [])

call s:Hi('Identifier',  s:variable, [])
call s:Hi('Function',    s:func_name, [])

call s:Hi('Statement',   s:keyword, [])
call s:Hi('Conditional', s:keyword, [])
call s:Hi('Repeat',      s:keyword, [])
call s:Hi('Label',       s:keyword, [])
call s:Hi('Operator',    s:punctuation, [])
call s:Hi('Keyword',     s:keyword, [])
call s:Hi('Exception',   s:keyword, [])

call s:Hi('PreProc',     s:lang_literal, [])
call s:Hi('Include',     s:keyword, [])
call s:Hi('Define',      s:keyword, [])
call s:Hi('Macro',       s:const_lang, [])
call s:Hi('PreCondit',   s:keyword, [])

call s:Hi('Type',        s:storage_type, [], 'italic')
call s:Hi('StorageClass', s:keyword, [])
call s:Hi('Structure',   s:class_name, [], 'underline')
call s:Hi('Typedef',     s:class_name, [])

call s:Hi('Special',     s:punctuation, [])
call s:Hi('SpecialChar', s:punctuation, [])
call s:Hi('Tag',         s:tag, [])
call s:Hi('Delimiter',   s:punctuation, [])
call s:Hi('SpecialComment', s:comment, [], 'italic')
call s:Hi('Debug',       s:keyword, [])

call s:Hi('Underlined',  s:class_name, [], 'underline')
call s:Hi('Ignore',      s:comment, [])
call s:Hi('Error',       s:white, s:invalid_bg)
call s:Hi('Todo',        s:bg, s:number, 'bold')

call s:Hi('htmlTag',          s:punctuation, [])
call s:Hi('htmlTagName',      s:tag, [])
call s:Hi('htmlEndTag',       s:punctuation, [])
call s:Hi('htmlArg',          s:attribute, [])
call s:Hi('htmlSpecialChar',  s:number, [])

call s:Hi('cssClassName',     s:class_name, [])
call s:Hi('cssTagName',       s:tag, [])
call s:Hi('cssIdentifier',    s:attr_id, [])
call s:Hi('cssPropertyValue', s:number, [])

call s:Hi('phpFunctions',     s:sup_function, [])
call s:Hi('phpMethodsVar',    s:func_name, [])
call s:Hi('phpVarSelector',   s:variable, [])

call s:Hi('rubySymbol',       s:sup_constant, [])
call s:Hi('rubyInstanceVariable', s:variable, [])

call s:Hi('pythonBuiltin',    s:sup_function, [])
call s:Hi('pythonDecorator',  s:const_lang, [])

call s:Hi('jsFuncCall',       s:func_name, [])
call s:Hi('jsThis',           s:lang_literal, [])

call s:Hi('markdownH1',       s:class_name, [], 'bold')
call s:Hi('markdownH2',       s:class_name, [], 'bold')
call s:Hi('markdownCode',     s:string, [])
call s:Hi('markdownUrl',      s:attribute, [], 'underline')

call s:Hi('DiffAdd',      s:git_added, s:bg)
call s:Hi('DiffChange',   s:git_changed, s:bg)
call s:Hi('DiffDelete',   s:git_deleted, s:bg)
call s:Hi('DiffText',     s:fg, s:selection, 'bold')
call s:Hi('diffAdded',    s:git_added, [])
call s:Hi('diffRemoved',  s:git_deleted, [])
call s:Hi('diffChanged',  s:git_changed, [])
call s:Hi('diffFile',     s:diff_header, [], 'bold')
call s:Hi('diffLine',     s:diff_header, [])

delfunction s:Hi
