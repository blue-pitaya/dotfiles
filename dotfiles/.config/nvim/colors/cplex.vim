" Thx for colorscheme https://github.com/nonoMain ! I edited it a little bit

" settings
set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='cplex'

if !exists("g:clearBackground")
	let g:clearBackground = 1
endif

let cNone='NONE'
let cYellow='#ffff00'
let cBlack='#000000'
let c17='#00005f'
let c24='#005f87'
let c19='#0000af'
let c22='#005f00'
let c38='#00afd7'
let c44='#00d7d7'
let c51='#00ffff'
let c52='#5f0000'
let c58='#5f5f00'
let c72='#5faf87'
let c75='#5fafff'
let c132='#af5f87'
let c140='#af87d7'
let c151='#afd7af'
let c160='#d70000'
let c167='#d75f5f'
let c168='#d75f87'
let c173='#d7875f'
let c186='#d7d787'
let c187='#d7d7af'
let c228="#ffff87"
let c234="#1c1c1c"
let c235='#262626'
let c236='#303030'
let c237='#3a3a3a'
let c238="#444444"
let c239='#4e4e4e'
let c240='#585858'
let c241="#626262"
let c242="#6c6c6c"
let c243='#767676'
let c249="#b2b2b2"
let c254="#e4e4e4"

let cDarkGreen="#062d06"
let cDarkRed="#440606"
let cDarkBlue="#080853"

" highlights are from 'genereateHighlights.vim' file in the config
"-------------- Cplex highlights --------------
let CustomColor = {} "
let CustomColor['Function'] = {"guifg": c187}
let CustomColor['Keyword'] = {"guifg": c167}
let CustomColor['StatusLineNC'] = {"guifg": c249, "guibg": c234 }
let CustomColor['Comment'] = {"guifg": c241, "guibg": cNone}
let CustomColor['VisualNOS'] = {"guifg": c249, "guibg": cNone}
let CustomColor['PmenuSbar'] = {"guifg": c238, "guibg": cNone}
let CustomColor['Cursor'] = {"gui": "reverse", "term": "reverse"}
let CustomColor['Visual'] = {"guifg": cNone, "guibg": c24}
let CustomColor['WildMenu'] = {"guifg": c249, "guibg": c234}
let CustomColor['CursorLine'] = {"guifg": cNone, "guibg": c236}
let CustomColor['CursorLineNr'] = {"guifg": c254, "guibg": cNone}
let CustomColor['Special'] = {"guifg": c38, "guibg": cNone}
let CustomColor['TabLineFill'] = {"guifg": cNone, "guibg": c234}
let CustomColor['PmenuSel'] = {"guifg": c249, "guibg": c24}
let CustomColor['LineNr'] = {"guifg": c243, "guibg": cNone}
let CustomColor['Search'] = {"guifg": cNone, "guibg": c19}
let CustomColor['Directory'] = {"guifg": c75, "guibg": cNone}
let CustomColor['Identifier'] = {"guifg": c254, "guibg": cNone, "gui": "bold"}
let CustomColor['TabLine'] = {"guifg": c254, "guibg": c234}
let CustomColor['PmenuThumb'] = {"guifg": cNone, "guibg": c24}
let CustomColor['Type'] = {"guifg": c72, "guibg": cNone}
let CustomColor['TabLineSel'] = {"guifg": c254, "guibg": c24}
let CustomColor['Delimiter'] = {"guifg": c254, "guibg": cNone}
let CustomColor['String'] = {"guifg": c173, "guibg": cNone}
let CustomColor['VertSplit'] = {"guifg": c237, "guibg": c237}
let CustomColor['Error'] = {"guifg": c160, "guibg": cNone, "gui": "bold"}
let CustomColor['Number'] = {"guifg": c151, "guibg": cNone}
let CustomColor['Pmenu'] = {"guifg": c249, "guibg": c234}
let CustomColor['Include'] = {"guifg": c168, "guibg": cNone}
let CustomColor['Constant'] = {"guifg": c187, "guibg": cNone}
let CustomColor['NonText'] = {"guifg": c240, "guibg": cNone}
let CustomColor['Character'] = {"guifg": c173, "guibg": cNone}
let CustomColor['SignColumn'] = {"guifg": cNone, "guibg": cNone}
let CustomColor['StatusLine'] = {"guifg": c249, "guibg": c234}
let CustomColor['StatusLineNC'] = {"guifg": c249, "guibg": c237}
let CustomColor['Operator'] = {"guifg": c132, "guibg": cNone}
let CustomColor['SpecialKey'] = {"guifg": c249, "guibg": cNone}
let CustomColor['Normal'] = {"guifg": c254, "guibg": cNone}
let CustomColor['Float'] = {"guifg": c151, "guibg": cNone}
let CustomColor['IncSearch'] = {"guifg": cNone, "guibg": c58}
let CustomColor['Folded'] = {"guifg": c239, "guibg": c234}
let CustomColor['Boolean'] = {"guifg": c140, "guibg": cNone}
let CustomColor['ColorColumn'] = {"guifg": cNone, "guibg": c234}
let CustomColor['Repeat'] = {"guifg": c140, "guibg": cNone}
let CustomColor['ErrorMsg'] = {"guifg": cNone, "guibg": c234}
let CustomColor['WarningMsg'] = {"guifg": cNone, "guibg": c234}
let CustomColor['LspCodeLens'] = {"guifg": c241, "guibg": cNone}
" Border
let CustomColor['NormalFloat'] = {"guifg": cNone, "guibg": cNone}
let CustomColor['FloatBorder'] = {"guifg": c241, "guibg": cNone}
" Telescope
let CustomColor['TelescopeBorder'] = {"guifg": c242, "guibg": cNone}
let CustomColor['TelescopeSelection'] = {"guibg": c237}
" Diff
let CustomColor['DiffChange'] = {"guifg": cNone, "guibg": c235}
let CustomColor['DiffText'] = {"guifg": cNone, "guibg": cDarkBlue}
let CustomColor['DiffAdd'] = {"guifg": cNone, "guibg": cDarkGreen}
let CustomColor['DiffDelete'] = {"guifg": cNone, "guibg": cDarkRed}
let CustomColor['DiffviewDiffDelete'] = {"guifg": cDarkRed, "guibg": cDarkRed}
let CustomColor['FoldColumn'] = {"guifg": c51, "guibg": cNone}
" Parens
let CustomColor['MatchParen'] = {"guifg": cNone, "guibg": c58}
" Scala
let CustomColor['scalaKeywordModifier'] = {"guifg": c140, "guibg": cNone}
" NvimTree
let CustomColor['NvimTreeFolderIcon'] = {"guifg": c186, "guibg": cNone}
let CustomColor['NvimTreeGitDirty'] = {"guifg": c44, "guibg": cNone}
let CustomColor['NvimTreeWindowPicker'] = {"guifg": c254, "guibg": c17, "gui": "bold"}
" Leap.nvim
let CustomColor['LeapLabelPrimary'] = {"guifg": cBlack, "guibg": cYellow, "gui": "bold"}
" Markdown
let CustomColor['markdownH1'] = {"guifg": c167}
let CustomColor['markdownH2'] = {"guifg": c228}
let CustomColor['markdownH3'] = {"guifg": c44}
let CustomColor['markdownH4'] = {"guifg": c151}
let CustomColor['markdownH5'] = {"guifg": c167}
let CustomColor['markdownH6'] = {"guifg": c167}


for key in keys(CustomColor)
    let s:colours = CustomColor[key]
    if has_key(s:colours, 'gui')
        let gui = s:colours['gui']
    else
        let gui='NONE'
    endif
    if has_key(s:colours, 'guifg')
        let guifg = s:colours['guifg']
    else
        let guifg='NONE'
    endif
    if has_key(s:colours, 'guibg')
        let guibg = s:colours['guibg']
    else
        let guibg='NONE'
    endif
    if has_key(s:colours, 'term')
        let term = s:colours['term']
    else
        let term='NONE'
    endif
    if has_key(s:colours, 'ctermfg')
        let ctermfg = s:colours['ctermfg']
    else
        let ctermfg='NONE'
    endif
    if has_key(s:colours, 'ctermbg')
        let ctermbg = s:colours['ctermbg']
    else
        let ctermbg='NONE'
    endif
    if key =~ '^\k*$'
        execute "hi ".key." term=".term." gui=".gui." ctermfg=".ctermfg." guifg=".guifg." ctermbg=".ctermbg." guibg=".guibg
    endif
endfor

hi! link NvimTreeGitNew NvimTreeGitDirty
hi! link NvimTreeGitStaged NvimTreeGitDirty

hi! link htmlTagName Keyword

" generic highlight groups
hi! link Title          Normal
hi! link Todo           Repeat
hi! link Conditional    Repeat
hi! link Statement      Repeat
hi! link PreProc        Repeat
hi! link SpecialComment Special 
hi! link CursorColumn   CursorLine
hi! link String         Character

" vim highlight groups
hi! link vimEnvvar       Constant
hi! link vimHiKeyList    Constant
hi! link vimCommand      Keyword
hi! link vimUsrCmd       Keyword
hi! link vimIsCommand    Keyword
hi! link vimNotFunc      Keyword
hi! link vimUserFunc     Function
hi! link vimCommentTitle Special 

" json highlight groups
hi! link jsonKeyword Keyword
hi! link jsonBoolean Boolean

" nvim-cmp
hi! link CmpItemKind           Type
hi! link CmpItemMenu           NonText
hi! link CmpItemAbbr           Identifier
hi! link CmpItemAbbrDeprecated Error

" tree-sitter highlight groups
hi! link @string             String
hi! link @operator           Operator
hi! link @function           Function
hi! link @funcBuiltin        Function
hi! link @funcMacro          Function
hi! link @error              Error
hi! link @punctDelimiter     PunctDelimiter
hi! link @punctBracket       PunctBracket
hi! link @punctSpecial       PunctSpecial
hi! link @constant           Constant
hi! link @constBuiltin       Constant
hi! link @constMacro         Type
hi! link @stringRegex        String
hi! link @stringEscape       Operator
hi! link @character          String
hi! link @number             Number
hi! link @boolean            Boolean
hi! link @float              Float
hi! link @annotation         Comment
hi! link @attribute          Attribute
hi! link @namespace          Namespace
hi! link @parameter          Normal
hi! link @parameterReference Normal
hi! link @method             Function
hi! link @field              Field
hi! link @property           Property
hi! link @constructor        Constructor
hi! link @conditional        Conditional
hi! link @repeat             Repeat
hi! link @label              Label
hi! link @keyword            Keyword
hi! link @keywordFunction    Keyword
hi! link @keywordOperator    Keyword
hi! link @exception          Exception
hi! link @type               Type
hi! link @typeBuiltin        Type
hi! link @structure          Type
hi! link @include            Include
hi! link @variable           Normal
hi! link @variableBuiltin    Normal
hi! link @text               Normal
hi! link @strong             Strong
hi! link @emphasis           Emphasis
hi! link @underline          Underline
hi! link @title              Title
hi! link @literal            Literal
hi! link @uRI                Identifier
hi! link @tag                Tag
hi! link @tagDelimiter       TagDelimiter
