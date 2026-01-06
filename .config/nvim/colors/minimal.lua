vim.o.background = "dark"
vim.g.colors_name = "minimal"

local hi = function(name, val)
	vim.api.nvim_set_hl(0, name, val)
end

--stylua: ignore start
local palette = {
	-- Primary
	yellow        = "#fabb00",
	white         = "#ffffff",
	white_1       = "#e1e4e8",
	white_2       = "#c8cdd6",
	white_3       = "#6b7280",

	-- Green (balanced)
	green_dark    = "#1a3d32",
	green         = "#4ec9a1",
	green_bright  = "#6dd9b5",

	-- Red (balanced)
  red_dark      = "#b5536a",
	red           = "#e86b82",
	red_bright    = "#f08399",

	-- Blue (balanced)
	blue_dark     = "#5682ab",
	blue          = "#6fa3d6",
	blue_bright   = "#8db8e3",

	-- Orange (balanced)
	orange_dark   = "#b77d52",
	orange        = "#e89c68",
	orange_bright = "#f0b080",

	-- Purple (balanced)
	purple_dark   = "#8f6fa7",
	purple        = "#b58dd1",
	purple_bright = "#c5a1df",

	-- Cyan (balanced)
	cyan_dark     = "#5690a7",
	cyan          = "#6db5d1",
	cyan_bright   = "#8bc7e0",

	-- Background shades
	base_0        = "#14161B", -- main (your base)
	base_1        = "#1a1d23",
	base_2        = "#1f222a",
	base_3        = "#24282f",
	base_4        = "#292d36",
	base_5        = "#2e333c",
	base_6        = "#343942",
	base_7        = "#3a3f49",
	base_8        = "#40454f",
	base_9        = "#464c56",
	base_10       = "#4d535e",
	base_11       = "#545a66", -- lightest
	base_light_0  = "#5a606c", -- main (slightly lighter than base_11)
	base_light_1  = "#60666f",
	base_light_2  = "#666c75",
	base_light_3  = "#6c727b",
	base_light_4  = "#727881",
	base_light_5  = "#787e87",
	base_light_6  = "#7e848d",
	base_light_7  = "#848a93",
	base_light_8  = "#8a9099",
	base_light_9  = "#90969f",
	base_light_10 = "#969ca5",
	base_light_11 = "#9ca2ab", -- lightest}
}




-- General
hi('Normal',       { bg = palette.base_0, fg = palette.white })
hi('EndOfBuffer',  { fg = palette.base_0 })

hi('Conceal',      { fg = palette.base_11 })
hi('Cursor',       {})
hi('lCursor',      {})
hi('DiffText',     { fg = palette.red_bright, bold = true })
hi('ErrorMsg',     { fg = palette.red })
hi('IncSearch',    { link = "Search" })
hi('ModeMsg',      { bold = true })
hi('NonText',      { fg = palette.white_2, bold = true })
hi('PmenuSbar',    { bg = palette.base_11 })
hi('StatusLine',   { bg = palette.base_0, bold = true })
hi('StatusLineNC', { fg = palette.base_11 })
hi('TabLineFill',  { link = "StatusLine" })
hi('TabLineSel',   { bold = true })
hi('TermCursor',   {})
hi('WinBar',       { bold = true })
hi('WildMenu',     { bg = palette.base_0, fg = palette.yellow, bold = true })

hi('VertSplit',      { link = 'Normal' })
hi('WinSeparator',   { fg = palette.base_8 })
hi('WinBarNC',       { link = 'WinBar' })
hi('DiffTextAdd',    { link = 'DiffText' })
hi('LineNrAbove',    { link = 'LineNr' })
hi('LineNrBelow',    { link = 'LineNr' })
hi('QuickFixLine',   { link = 'Search' })
hi('CursorLineSign', { link = 'SignColumn' })
hi('CursorLineFold', { link = 'FoldColumn' })
hi('CurSearch',      { link = 'Search' })
hi('PmenuKind',      { link = 'Pmenu' })
hi('PmenuKindSel',   { link = 'PmenuSel' })
hi('PmenuMatch',     { link = 'Pmenu' })
hi('PmenuMatchSel',  { link = 'PmenuSel' })
hi('PmenuExtra',     { link = 'Pmenu' })
hi('PmenuExtraSel',  { link = 'PmenuSel' })
hi('PreInsert',      { link = 'Added' })
hi('ComplMatchIns',  {})
hi('ComplHint',      { link = 'NonText' })
hi('ComplHintMore',  { link = 'MoreMsg' })
hi('Substitute',     { link = 'Search' })
hi('Whitespace',     { link = 'NonText' })
hi('MsgSeparator',   { link = 'StatusLine' })
hi('NormalFloat',    { link = 'Pmenu' })
hi('FloatBorder',    { link = 'WinSeparator' })
hi('FloatTitle',     { link = 'Title' })
hi('FloatFooter',    { link = 'Title' })

hi('FloatShadow',          { bg = palette.base_0, blend=80 })
hi('FloatShadowThrough',   { bg = palette.base_0, blend=100 })
hi('RedrawDebugNormal',    {})
hi('RedrawDebugClear',     {})
hi('RedrawDebugComposed',  {})
hi('RedrawDebugRecompose', {})
hi('Error',                { fg = palette.red })
hi('Todo',                 { fg = palette.white_1 })

hi('String',         { fg = palette.green })
hi('Character',      { link = 'Constant' })
hi('Number',         { link = 'Constant' })
hi('Boolean',        { link = 'Constant' })
hi('Float',          { link = 'Number' })
hi('Conditional',    { link = 'Statement' })
hi('Repeat',         { link = 'Statement' })
hi('Label',          { link = 'Statement' })
hi('Keyword',        { link = 'Statement' })
hi('Exception',      { link = 'Statement' })
hi('Include',        { link = 'PreProc' })
hi('Define',         { link = 'PreProc' })
hi('Macro',          { link = 'PreProc' })
hi('PreCondit',      { link = 'PreProc' })
hi('StorageClass',   { link = 'Type' })
hi('Structure',      { link = 'Type' })
hi('Typedef',        { link = 'Type' })
hi('Tag',            { link = 'Special' })
hi('SpecialChar',    { link = 'Special' })
hi('Delimiter',      { link = 'Special' })
hi('SpecialComment', { link = 'Special' })
hi('Debug',          { link = 'Special' })

hi('DiagnosticError',            { fg = palette.red })
hi('DiagnosticWarn',             { fg = palette.orange_bright })
hi('DiagnosticInfo',             { fg = palette.blue })
hi('DiagnosticHint',             { fg = palette.base_light_2 })
hi('DiagnosticOk',               { fg = palette.green_bright })
hi('DiagnosticUnderlineError',   { sp = palette.red, underline = true })
hi('DiagnosticUnderlineWarn',    { sp = palette.orange_bright, underline = true })
hi('DiagnosticUnderlineInfo',    { sp = palette.blue, underline = true })
hi('DiagnosticUnderlineHint',    { sp = palette.base_light_2, underline = true })
hi('DiagnosticUnderlineOk',      { sp = palette.green_bright, underline = true })
hi('DiagnosticVirtualTextError', { link = 'DiagnosticError' })
hi('DiagnosticVirtualTextWarn',  { link = 'DiagnosticWarn' })
hi('DiagnosticVirtualTextInfo',  { link = 'DiagnosticInfo' })
hi('DiagnosticVirtualTextHint',  { link = 'DiagnosticHint' })
hi('DiagnosticVirtualTextOk',    { link = 'DiagnosticOk' })
hi('DiagnosticFloatingError',    { link = 'DiagnosticError' })
hi('DiagnosticFloatingWarn',     { link = 'DiagnosticWarn' })
hi('DiagnosticFloatingInfo',     { link = 'DiagnosticInfo' })
hi('DiagnosticFloatingHint',     { link = 'DiagnosticHint' })
hi('DiagnosticFloatingOk',       { link = 'DiagnosticOk' })
hi('DiagnosticSignError',        { link = 'DiagnosticError' })
hi('DiagnosticSignWarn',         { link = 'DiagnosticWarn' })
hi('DiagnosticSignInfo',         { link = 'DiagnosticInfo' })
hi('DiagnosticSignHint',         { link = 'DiagnosticHint' })
hi('DiagnosticSignOk',           { link = 'DiagnosticOk' })
hi('DiagnosticDeprecated',       { strikethrough = true })

hi('DiagnosticUnnecessary', { link = 'Comment' })
hi('LspInlayHint',          { link = 'NonText' })
hi('SnippetTabstop',        { link = 'Visual' })
hi('SnippetTabstopActive',  { link = 'SnippetTabstop' })

-- Text
hi('@markup.raw',       { link = 'Comment' })
hi('@markup.link',      { link = 'Identifier' })
hi('@markup.heading',   { link = 'Title' })
hi('@markup.link.url',  { link = 'Underlined' })
hi('@markup.underline', { link = 'Underlined' })
hi('@comment.todo',     { link = 'Todo' })

-- Miscs
hi('@comment',     { link = 'Comment' })
hi('@punctuation', { link = 'Delimiter' })

-- Constants
hi('@constant',          { link = 'Constant' })
hi('@constant.builtin',  { link = 'Special' })
hi('@constant.macro',    { link = 'Define' })
hi('@keyword.directive', { link = 'Define' })
hi('@string',            { link = 'String' })
hi('@string.escape',     { link = 'SpecialChar' })
hi('@string.special',    { link = 'SpecialChar' })
hi('@character',         { link = 'Character' })
hi('@character.special', { link = 'SpecialChar' })
hi('@number',            { link = 'Number' })
hi('@boolean',           { link = 'Boolean' })
hi('@number.float',      { link = 'Float' })

-- Functions
hi('@function',                   { link = 'Function' })
hi('@function.builtin',           { link = 'Special' })
hi('@function.macro',             { link = 'Macro' })
hi('@function.method',            { link = 'Function' })
hi('@variable.parameter',         { link = 'Identifier' })
hi('@variable.parameter.builtin', { link = 'Special' })
hi('@variable.member',            { link = 'Identifier' })
hi('@property',                   { link = 'Identifier' })
hi('@attribute',                  { link = 'Macro' })
hi('@attribute.builtin',          { link = 'Special' })
hi('@constructor',                { link = 'Special' })

-- Keywords
hi('@keyword.conditional', { link = 'Conditional' })
hi('@keyword.coroutine',   { fg = palette.white_1, bold = true })
hi('@keyword.repeat',      { link = 'Repeat' })
hi('@keyword.type',        { link = 'Structure' })
hi('@label',               { link = 'Label' })
hi('@operator',            { link = 'Operator' })
hi('@keyword',             { link = 'Keyword' })
hi('@keyword.exception',   { fg = palette.red, bold = true })

hi('@variable',          { link = 'Identifier' })
hi('@type',              { link = 'Type' })
hi('@type.definition',   { link = 'Typedef' })
hi('@module',            { link = 'Identifier' })
hi('@keyword.import',    { link = 'Include' })
hi('@keyword.directive', { link = 'PreProc' })
hi('@keyword.debug',     { link = 'Debug' })
hi('@tag',               { link = 'Tag' })
hi('@tag.builtin',       { link = 'Special' })

-- LSP semantic tokens
hi('@lsp.type.class',         { link = 'Structure' })
hi('@lsp.type.comment',       { link = 'Comment' })
hi('@lsp.type.decorator',     { link = 'Function' })
hi('@lsp.type.enum',          { link = 'Structure' })
hi('@lsp.type.enumMember',    { link = 'Constant' })
hi('@lsp.type.function',      { link = 'Function' })
hi('@lsp.type.interface',     { link = 'Structure' })
hi('@lsp.type.macro',         { link = 'Macro' })
hi('@lsp.type.method',        { link = 'Function' })
hi('@lsp.type.namespace',     { link = 'Structure' })
hi('@lsp.type.parameter',     { link = 'Identifier' })
hi('@lsp.type.property',      { link = 'Identifier' })
hi('@lsp.type.struct',        { link = 'Structure' })
hi('@lsp.type.type',          { link = 'Type' })
hi('@lsp.type.typeParameter', { link = 'TypeDef' })
hi('@lsp.type.variable',      { link = 'Identifier' })

hi('ColorColumn',      { bg = palette.base_2 })
hi('CursorColumn',     { bg = palette.base_2 })
hi('CursorLine',       { bg = palette.base_2 })
hi('CursorLineNr',     { fg = palette.white, bold = true })
hi('DiffAdd',          { bg = palette.green_dark })
hi('DiffChange',       { bg = palette.purple_dark })
hi('DiffDelete',       { bg = palette.red_dark, bold = true })
hi('Directory',        { fg = palette.yellow })
hi('FoldColumn',       { fg = palette.base_light_2 })
hi('Folded',           { fg = palette.base_light_2 })
hi('Function',         { fg = palette.white_2 })
hi('LineNr',           { fg = palette.white_3 })
hi('MatchParen',       { fg = palette.yellow })
hi('MoreMsg',          { fg = palette.white, bold = true })
hi('Operator',         { fg = palette.white })
hi('Pmenu',            { bg = palette.base_0 })
hi('PmenuSel',         { bg = palette.base_3 })
hi('PmenuThumb',       { bg = palette.base_11 })
hi('Question',         { fg = palette.white, bold = true })
hi('Search',           { bg = palette.base_6 })
hi('SignColumn',       { bg = palette.base_0 })
hi('SpecialKey',       { fg = palette.white })
hi('StatusLineTerm',   { link = 'StatusLine' })
hi('StatusLineTermNC', { link = 'StatusLineNC' })
hi('TabLine',          { link = "StatusLine" })
hi('Title',            { fg = palette.white, bold = true })
hi('Visual',           { bg = palette.base_4 })
hi('WarningMsg',       { fg = palette.orange })
hi('Comment',          { fg = palette.base_light_2 })
hi('Constant',         { fg = palette.white_2 })
hi('Special',          { fg = palette.white })
hi('Identifier',       { fg = palette.white })
hi('Statement',        { fg = palette.yellow, bold = true })
hi('PreProc',          { fg = palette.white_1, bold = true })
hi('Type',             { fg = palette.white_1, bold = true })
hi('Underlined',       { fg = palette.white, underline = true })
hi('Ignore',           {})
hi('Added',            { fg = palette.green })
hi('Changed',          { fg = palette.blue })
hi('Removed',          { fg = palette.red })

local test = ""
--stylua: ignore end
