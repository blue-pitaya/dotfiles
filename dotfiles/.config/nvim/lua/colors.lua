-- Thx for colorscheme https://github.com/nonoMain ! I edited it a little bit

vim.opt.background = "dark"
vim.cmd([[hi clear]])
vim.cmd([[syntax reset]])

local cNone='NONE'
local c17='#00005f'
local c24='#005f87'
local c19='#0000af'
local c38='#00afd7'
local c44='#00d7d7'
local c51='#00ffff'
local c58='#5f5f00'
local c72='#5faf87'
local c75='#5fafff'
local c132='#af5f87'
local c140='#af87d7'
local c151='#afd7af'
local c160='#d70000'
local c167='#f27775' --changed
local c168='#d75f87'
local c173='#c89f8a' --changed
local c184='#d7d700'
local c186='#d7d787'
local c187='#d7d7af'
local c228="#ffff87"
local c234="#1c1c1c"
local c235='#262626'
local c236='#303030'
local c237='#3a3a3a'
local c238="#444444"
local c239='#4e4e4e'
local c240='#585858'
local c241="#626262"
local c242="#6c6c6c"
local c243='#767676'
local c249="#b2b2b2"
local c254="#e4e4e4"

local cDarkGreen="#062d06"
local cDarkRed="#440606"
local cDarkBlue="#080853"

local seth = function (name, val)
  vim.api.nvim_set_hl(0, name, val)
end

local h = seth


local mainCol1 = c167 -- used for keywords mainly
local mainCol2 = c187 -- used for functions, vars names
local mainCol3 = c72  -- used for types 
local mainCol4 = c173 -- used for strings, numbers etc
local mainCol5 = c140 -- used for operators
local mainCol6 = c241 -- comments
local mainCol7 = c151 -- numbers
local mainCol8 = c38 -- special

local cols = {
  red = c167
}

local p = {
  subtle = '#908caa',
  love = '#eb6f92',
  gold = '#edd392',
  rose = '#ea9a97',
  pine = c38,
  foam = '#9ccfd8',
  iris = '#c4a7e7',
}

h('Keyword', { fg = mainCol1 })
h('Boolean', { fg = p.rose })
h('Conditional', { link = "Keyword" })
h('Constant', { fg = p.love })
h('Debug', { fg = p.rose })
h('Define', { fg = p.iris })
h('Delimiter', { fg = p.subtle })
h('Error', { fg = p.love })
h('Exception', { fg = p.pine })
h('Float', { fg = p.love })
h('Function', { fg = p.rose })
h('Identifier', { fg = p.rose })
h('Include', { link = "Keyword" })
h('Label', { fg = p.foam })
h('Macro', { fg = p.iris })
h('Number', { link = "Normal" })
h('Operator', { link = "Normal" })
h('PreCondit', { fg = p.iris })
h('PreProc', { fg = p.pine })
h('Repeat', { link = "Keyword" })
h('Special', { fg = p.pine })
h('SpecialChar', { fg = p.rose })
h('SpecialComment', { fg = p.iris })
h('Statement', { fg = p.pine })
h('StorageClass', { fg = p.foam })
h('String', { fg = mainCol4 })
h('Structure', { fg = p.foam })
h('Tag', { fg = p.foam })
h('Type', { fg = p.foam })
h('Typedef', { link = 'Type' })
h('Underlined', { underline = true })
h('Todo', { link = 'Comment' })

-- Code
--seth('Keyword', {fg = mainCol1})
--seth('Include', {fg = mainCol1})
seth('Function', {fg = p.gold})
--seth('Special', {fg = mainCol8})
seth('Comment', {fg = mainCol6})
seth('Type', {fg = '#5aaa82'})
--seth('Number', {fg = mainCol7})
----seth('Boolean', {fg = c140, bg = cNone})
--seth('Boolean', {link = 'Keyword'})
--seth('Repeat', {fg = c140}) -- this also links to preproc


-- General
seth('StatusLineNC', {fg = c249, bg = c234 })
seth('VisualNOS', {fg = c249, bg = cNone})
seth('PmenuSbar', {fg = c238, bg = cNone})
seth('Cursor', {reverse = true})
seth('Visual', {fg = cNone, bg = c24})
seth('WildMenu', {fg = c249, bg = c234})
seth('CursorLine', {fg = cNone, bg = c236})
seth('CursorLineNr', {fg = c254, bg = cNone})
seth('TabLineFill', {fg = cNone, bg = c234})
seth('PmenuSel', {fg = c249, bg = c24})
seth('LineNr', {fg = c243, bg = cNone})
seth('Search', {fg = cNone, bg = c238})
seth('Directory', {fg = c75, bg = cNone})
seth('Identifier', {fg = c254, bg = cNone})
seth('TabLine', {fg = c254, bg = c234})
seth('PmenuThumb', {fg = cNone, bg = c24})
seth('TabLineSel', {fg = c254, bg = c24})
seth('Delimiter', {fg = c254, bg = cNone})
seth('VertSplit', {fg = c237, bg = c237})
seth('Error', {fg = c160, bg = cNone, bold = true})
seth('Pmenu', {fg = c249, bg = c234})
seth('Constant', {fg = c187, bg = cNone})
seth('NonText', {fg = c240, bg = cNone})
seth('SignColumn', {fg = cNone, bg = cNone})
seth('StatusLine', {fg = c249, bg = c234})
seth('StatusLineNC', {fg = c249, bg = c237})
--seth('Operator', {fg = c132, bg = cNone})
seth('SpecialKey', {fg = c249, bg = cNone})
--seth('Normal', {fg = c254, bg = cNone})
seth('Normal', {fg = "#dedede"})
seth('Float', {fg = c151, bg = cNone})
seth('IncSearch', {fg = cNone, bg = c58})
seth('Folded', {fg = c239, bg = c234})
seth('ColorColumn', {fg = cNone, bg = c234})
seth('ErrorMsg', {fg = cNone, bg = c234})
seth('WarningMsg', {fg = cNone, bg = c234})
seth('LspCodeLens', {fg = c241, bg = cNone})

-- Border
seth('NormalFloat', {fg = cNone, bg = cNone})
seth('FloatBorder', {fg = c241, bg = cNone})

-- Telescope
seth('TelescopeBorder', {fg = c242, bg = cNone})
seth('TelescopeSelection', {bg = c237})

-- Diff
seth('DiffChange', {fg = cNone, bg = c235})
seth('DiffText', {fg = cNone, bg = cDarkBlue})
seth('DiffAdd', {fg = cNone, bg = cDarkGreen})
seth('DiffDelete', {fg = cNone, bg = cDarkRed})
seth('DiffviewDiffDelete', {fg = cDarkRed, bg = cDarkRed})
seth('FoldColumn', {fg = c51, bg = cNone})

-- Parens
seth('MatchParen', {fg = cNone, bg = c58})

-- Scala
h('scalaKeywordModifier', {link = 'Keyword'})
h('scalaOperator', {link = 'Operator'})
h('scalaCapitalWord', { link = "Normal" })
h('scalaCaseFollowing', { link = "Normal" })
h('scalaAkkaSpecialWord', { link = "Normal" })
h('scalatestSpecialWord', { link = "Normal" })
h('scalaSpecial', { link = "Operator" })
h('scalaInstanceDeclaration', { fg = p.iris })

-- NvimTree
seth('NvimTreeFolderIcon', {fg = c186, bg = cNone})
seth('NvimTreeGitDirty', {fg = c44, bg = cNone})
seth('NvimTreeWindowPicker', {fg = c254, bg = c17, bold = true})

-- Markdown
seth('markdownH1', {fg = c167})
seth('markdownH2', {fg = c228})
seth('markdownH3', {fg = c44})
seth('markdownH4', {fg = c151})
seth('markdownH5', {fg = c167})
seth('markdownH6', {fg = c167})

-- Diagnostics
seth('DiagnosticUnderlineError', {sp = '#af0000', underline = true})
seth('DiagnosticUnderlineWarn', {sp = '#707000', underline = true})

-- Misc
seth("NvimTreeGitNew", {link = "NvimTreeGitDirty"})
seth("NvimTreeGitStaged", {link = "NvimTreeGitDirty"})
seth("htmlTagName", {link = "Keyword"})

-- generic highlight groups
seth("Title", {link = "Normal"})
seth("SpecialComment", {link = "Special"})
seth("CursorColumn", {link = "CursorLine"})
--seth("String", {link = "Character"})

-- vim highlight groups
seth("vimEnvvar", {link = "Constant"})
seth("vimHiKeyList", {link = "Constant"})
seth("vimCommand", {link = "Keyword"})
seth("vimUsrCmd", {link = "Keyword"})
seth("vimIsCommand", {link = "Keyword"})
seth("vimNotFunc", {link = "Keyword"})
seth("vimUserFunc", {link = "Function"})
seth("vimCommentTitle", {link = "Special"})

-- json highlight groups
seth("jsonKeyword", {link = "Keyword"})
seth("jsonBoolean", {link = "Boolean"})

-- nvim-cmp
seth("CmpItemKind", {link = "Type"})
seth("CmpItemMenu", {link = "NonText"})
seth("CmpItemAbbr", {link = "Identifier"})
seth("CmpItemAbbrDeprecated", {link = "Error"})

-- tree-sitter highlight groups
seth("@string", {link = "String"})
seth("@operator", {link = "Operator"})
seth("@function", {link = "Function"})
seth("@funcMacro", {link = "Function"})
seth("@error", {link = "Error"})
seth("@punctDelimiter", {link = "PunctDelimiter"})
seth("@punctBracket", {link = "PunctBracket"})
seth("@punctSpecial", {link = "PunctSpecial"})
seth("@constant", {link = "Constant"})
seth("@constBuiltin", {link = "Constant"})
seth("@constMacro", {link = "Type"})
seth("@stringRegex", {link = "String"})
seth("@stringEscape", {link = "Operator"})
seth("@character", {link = "String"})
seth("@number", {link = "Number"})
seth("@boolean", {link = "Boolean"})
seth("@float", {link = "Float"})
seth("@annotation", {link = "Comment"})
seth("@attribute", {link = "Attribute"})
seth("@namespace", {link = "Namespace"})
seth("@parameter", {link = "Normal"})
seth("@parameterReference", {link = "Normal"})
seth("@method", {link = "Function"})
seth("@field", {link = "Field"})
seth("@property", {link = "Property"})
seth("@constructor", {link = "Constructor"})
seth("@conditional", {link = "Conditional"})
seth("@repeat", {link = "Repeat"})
seth("@label", {link = "Label"})
seth("@keyword", {link = "Keyword"})
seth("@keywordFunction", {link = "Keyword"})
seth("@keywordOperator", {link = "Keyword"})
seth("@exception", {link = "Exception"})
seth("@type", {link = "Type"})
seth("@typeBuiltin", {link = "Type"})
seth("@structure", {link = "Type"})
seth("@include", {link = "Include"})
seth("@variable", {link = "Normal"})
seth("@variableBuiltin", {link = "Normal"})
seth("@text", {link = "Normal"})
seth("@strong", {link = "Strong"})
seth("@emphasis", {link = "Emphasis"})
seth("@underline", {link = "Underline"})
seth("@title", {link = "Title"})
seth("@literal", {link = "Literal"})
seth("@uRI", {link = "Identifier"})
seth("@tag", {link = "Tag"})
seth("@tagDelimiter", {link = "TagDeliWarn"})
