-- Name:         Onebuddy
-- Description:  Light and dark atom one theme
-- Author:       Th3Whit3Wolf <the.white.wolf.is.1337@gmail.com>
-- Maintainer:   Th3Whit3Wolf <the.white.wolf.is.1337@gmail.com>
-- Website:      httpc.//github.com/Th3Whit3Wolf/onebuddy
-- License:      MIT
local status, n = pcall(require, "colorbuddy")
if (not status) then
  return
end

print("Loaded one_dark_custom")

local Color, c, Group, g, s = require("colorbuddy").setup()
local b = s.bold
local i = s.italic
local n = s.inverse
local uc = s.undercurl
local ul = s.underline
local r = s.reverse
local sto = s.standout
local no = s.NONE
local v = vim

local italics = (function()
  if vim.g.onebuddy_disable_italics ~= true then
    return i
  else
    return no
  end
end)()

v.g.colors_name = "one_dark_custom"
Color.new("mono_1", "#FEFEFE")
Color.new("mono_2", "#828997")
Color.new("mono_3", "#5c6370")
Color.new("mono_4", "#4b5263")
Color.new("hue_1", "#68D980")
Color.new("hue_2", "#67BBFF")
Color.new("hue_3", "#c678dd")
Color.new("hue_4", "#A9D987")
Color.new("hue_5", "#e06c75")
Color.new("hue_5_2", "#be5046")
Color.new("hue_6", "#d19a66")
Color.new("hue_6_2", "#e5c07b")
Color.new("fold", "#8C764B")
Color.new("syntax_bg", "#1F2123")
Color.new("syntax_gutter", "#636d83")
Color.new("syntax_cursor", "#2c323c")
Color.new("syntax_accent", "#528bff")
Color.new("vertsplit", "#2480D5")
Color.new("special_grey", "#3b4048")
Color.new("visual_grey", "#3e4452")
Color.new("pmenu", "#333841")

-- Custom
Color.new("cBlack", "#1F2123")
Color.new("cWhite", "#FEFEFE")
Color.new("cBlue", "#2480D5")
Color.new("cGreen", "#A9D987")
Color.new("cGreenDark", "#68D980")
Color.new("cPurple", "#c678dd")
Color.new("cOrange", "#d19a66")
Color.new("cRed", "#e06c75")
Color.new("cRedBright", "#F70067")
Color.new("cYellow", "#e5c07b")
Color.new("cPink", "#ff2f87")
Color.new("customSpell", "#E19BA0")

-------------------------
-- Diagnostic  Colors --
-------------------------
Color.new("dError", "#630900")
Color.new("dWarning", "#E97E19")
Color.new("dInformation", "#2480D5")
Color.new("dHint", "#A9D987")

-------------------------
-- Vim Primary Colors --
-------------------------
Color.new("Red", "#e06c75")
Color.new("DarkRed", "#773B40")
Color.new("Blue", "#61afef")
Color.new("DarkBlue", "#528bff")
Color.new("Green", "#98c379")
Color.new("DarkGreen", "#50a14f")
Color.new("Orange", "#d19a66")
Color.new("DarkOrange", "#c18401")
Color.new("Yellow", "#ebca8d")
Color.new("DarkYellow", "#986801")
Color.new("Purple", "#a626a4")
Color.new("Violet", "#b294bb")
Color.new("Magenta", "#ff80ff")
Color.new("DarkMagenta", "#a626a4")
Color.new("Black", "#313538")
Color.new("Grey", "#636d83")
Color.new("White", "#fefefe")
Color.new("Cyan", "#8abeb7")
Color.new("DarkCyan", "#80a0ff")
Color.new("Aqua", "#8ec07c")
Color.new("pink", "#ff80ff")

-------------------------
-- Vim Terminal Colors --
-------------------------

v.g.terminal_color_0 = "#353a44"
v.g.terminal_color_8 = "#353a44"
v.g.terminal_color_1 = "#e88388"
v.g.terminal_color_9 = "#e88388"
v.g.terminal_color_2 = "#a7cc8c"
v.g.terminal_color_10 = "#a7cc8c"
v.g.terminal_color_3 = "#ebca8d"
v.g.terminal_color_11 = "#ebca8d"
v.g.terminal_color_4 = "#72bef2"
v.g.terminal_color_12 = "#72bef2"
v.g.terminal_color_5 = "#d291e4"
v.g.terminal_color_13 = "#d291e4"
v.g.terminal_color_6 = "#65c2cd"
v.g.terminal_color_14 = "#65c2cd"
v.g.terminal_color_7 = "#e3e5e9"
v.g.terminal_color_15 = "#e3e5e9"

-----------------------------
--     LSP Highlighting    --
-----------------------------
Group.new("DiagnosticError", c.dError, c.none, no)
Group.new("DiagnosticWarning", c.dWarning, c.none, no)
Group.new("DiagnosticInformation", c.dInformation, c.none, no)
Group.new("DiagnosticHint", c.dHint, c.none, no)

Group.new("FloatBorder", c.cRedBright, c.none, no)
Group.new("NormalFloat", c.mono_1, c.none, no)

-----------------------
--     WHICH KEY     --
-----------------------
Group.new("WhichKey", c.cBlue, c.none, b)
Group.new("WhichKeyFloat", c.White, c.cBlack, no)
Group.new("WhichKeyGroup", c.cYellow, c.none, b)
Group.new("WhichKeyDesc", c.dHint, c.none, no)

-----------------------
--    LightSpeed     --
-----------------------
Group.new("LightSpeedLabel", c.cGreen, c.none, b)
Group.new("LightSpeedShortcut", c.cPink, c.none, b)
Group.new("LightSpeedLabelOverlapped", c.White, c.Green, no)

----------------------
-- Vim Editor Color --
----------------------

-- PMENU
Group.new("PMenu", c.none, c.pmenu, no)
Group.new("PMenuSel", c.none, c.mono_4, no)
Group.new("PMenuSbar", c.none, c.mono_3, no)
Group.new("PMenuThumb", c.none, c.mono_1, no)

Group.new("Normal", c.mono_1, c.syntax_bg, no)
Group.new("bold", c.none, c.none, b)
Group.new("ColorColumn", c.none, c.syntax_cursor, no)
Group.new("Conceal", c.mono_4, c.syntax_bg, no)
Group.new("Cursor", c.none, c.syntax_accent, no)
Group.new("CursorIM", c.none, c.none, no)
Group.new("CursorColumn", c.none, c.syntax_cursor, no)
Group.new("CursorLine", c.none, c.syntax_cursor, no)
Group.new("Directory", c.hue_2, c.none, no)
Group.new("ErrorMsg", c.hue_5, c.none, no)
Group.new("VertSplit", c.vertsplit, c.none, no)
Group.new("Folded", c.special_grey, c.none, no)
Group.new("FoldColumn", c.mono_3, c.syntax_cursor, no)
Group.new("IncSearch", c.syntax_bg, c.hue_2, no)
Group.new("LineNr", c.mono_4, c.none, no)
Group.new("CursorLineNr", c.mono_1, c.syntax_cursor, no)
Group.new("MatchParen", c.hue_5, c.syntax_cursor, ul + b)
Group.new("Italic", c.none, c.none, italics)
Group.new("ModeMsg", c.mono_1, c.none, no)
Group.new("MoreMsg", c.mono_1, c.none, no)
Group.new("NonText", c.mono_3, c.none, no)

Group.new("Question", c.hue_2, c.none, no)
Group.new("Search", c.mono_3, c.hue_6_2, no)
Group.new("SpecialKey", c.special_grey, c.none, no)
Group.new("Whitespace", c.special_grey, c.none, no)
Group.new("StatusLine", c.mono_1, c.none, no)
Group.new("StatusLineNC", c.mono_3, c.none, no)
Group.new("TabLine", c.mono_2, c.visual_grey, no)
Group.new("TabLineFill", c.mono_3, c.visual_grey, no)
Group.new("TabLineSel", c.mono_3, c.hue_2, no)
Group.new("Title", c.mono_1, c.none, b)
Group.new("Visual", c.none, c.visual_grey, no)
Group.new("VisualNOS", c.none, c.visual_grey, no)
Group.new("WarningMsg", c.hue_5, c.none, no)
Group.new("TooLong", c.hue_5, c.none, no)
Group.new("WildMenu", c.mono_1, c.mono_3, no)
Group.new("SignColumn", c.none, c.none, no)
Group.new("Special", c.hue_2, c.none, no)

---------------------------
-- Vim Help Highlighting --
---------------------------

Group.new("helpCommand", c.hue_6_2, c.none, no)
Group.new("helpExample", c.hue_6_2, c.none, no)
Group.new("helpHeader", c.mono_1, c.none, b)
Group.new("helpSectionDelim", c.mono_3, c.none, no)

----------------------------------
-- Standard Syntax Highlighting --
----------------------------------

Group.new("Comment", c.mono_3, c.none, italics)
Group.new("Constant", c.hue_4, c.none, no)
Group.new("String", c.hue_4, c.none, no)
Group.new("Character", c.hue_4, c.none, no)
Group.new("Number", c.hue_6, c.none, no)
Group.new("Boolean", c.hue_6, c.none, no)
Group.new("Float", c.hue_6, c.none, no)
Group.new("Identifier", c.hue_5, c.none, no)
Group.new("Function", c.hue_2, c.none, no)
Group.new("Statement", c.hue_3, c.none, no)
Group.new("Conditional", c.hue_3, c.none, no)
Group.new("Repeat", c.hue_3, c.none, no)
Group.new("Label", c.hue_3, c.none, no)
Group.new("Operator", c.syntax_accent, c.none, no)
Group.new("Keyword", c.hue_5, c.none, no)
Group.new("Exception", c.hue_3, c.none, no)
Group.new("PreProc", c.hue_6_2, c.none, no)
Group.new("Include", c.hue_2, c.none, no)
Group.new("Define", c.hue_3, c.none, no)
Group.new("Macro", c.hue_3, c.none, no)
Group.new("PreCondit", c.hue_6_2, c.none, no)
Group.new("Type", c.hue_6_2, c.none, no)
Group.new("StorageClass", c.hue_6_2, c.none, no)
Group.new("Structure", c.hue_6_2, c.none, no)
Group.new("Typedef", c.hue_6_2, c.none, no)
Group.new("Special", c.hue_2, c.none, no)
Group.new("SpecialChar", c.none, c.none, no)
Group.new("Tag", c.none, c.none, no)
Group.new("Delimiter", c.none, c.none, no)
Group.new("SpecialComment", c.none, c.none, no)
Group.new("Debug", c.none, c.none, no)
Group.new("Underlined", c.none, c.none, ul)
Group.new("Ignore", c.none, c.none, no)
Group.new("Error", c.hue_5, c.mono_3, b)
Group.new("Todo", c.hue_3, c.mono_3, no)

-----------------------
-- Diff Highlighting --
-----------------------
Group.new("DiffAdd", c.hue_4, c.visual_grey, no)
Group.new("DiffChange", c.hue_6, c.visual_grey, no)
Group.new("DiffDelete", c.hue_5, c.visual_grey, no)
Group.new("DiffText", c.hue_2, c.visual_grey, no)
Group.new("DiffAdded", c.hue_4, c.visual_grey, no)
Group.new("DiffFile", c.hue_5, c.visual_grey, no)
Group.new("DiffNewFile", c.hue_4, c.visual_grey, no)
Group.new("DiffLine", c.hue_2, c.visual_grey, no)
Group.new("DiffRemoved", c.hue_5, c.visual_grey, no)

---------------------------
-- Filetype Highlighting --
---------------------------

-- Asciidoc
Group.new("asciidocListingBlock", c.mono_2, c.none, no)

-- C/C++ highlighting
Group.new("cInclude", c.hue_3, c.none, no)
Group.new("cPreCondit", c.hue_3, c.none, no)
Group.new("cPreConditMatch", c.hue_3, c.none, no)
Group.new("cType", c.hue_3, c.none, no)
Group.new("cStorageClass", c.hue_3, c.none, no)
Group.new("cStructure", c.hue_3, c.none, no)
Group.new("cOperator", c.hue_3, c.none, no)
Group.new("cStatement", c.hue_3, c.none, no)
Group.new("cTODO", c.hue_3, c.none, no)
Group.new("cConstant", c.hue_6, c.none, no)
Group.new("cSpecial", c.hue_1, c.none, no)
Group.new("cSpecialCharacter", c.hue_1, c.none, no)
Group.new("cString", c.hue_4, c.none, no)
Group.new("cppType", c.hue_3, c.none, no)
Group.new("cppStorageClass", c.hue_3, c.none, no)
Group.new("cppStructure", c.hue_3, c.none, no)
Group.new("cppModifier", c.hue_3, c.none, no)
Group.new("cppOperator", c.hue_3, c.none, no)
Group.new("cppAccess", c.hue_3, c.none, no)
Group.new("cppStatement", c.hue_3, c.none, no)
Group.new("cppConstant", c.hue_5, c.none, no)
Group.new("cCppString", c.hue_4, c.none, no)

-- Cucumber
Group.new("cucumberGiven", c.hue_2, c.none, no)
Group.new("cucumberWhen", c.hue_2, c.none, no)
Group.new("cucumberWhenAnd", c.hue_2, c.none, no)
Group.new("cucumberThen", c.hue_2, c.none, no)
Group.new("cucumberThenAnd", c.hue_2, c.none, no)
Group.new("cucumberUnparsed", c.hue_6, c.none, no)
Group.new("cucumberFeature", c.hue_5, c.none, b)
Group.new("cucumberBackground", c.hue_3, c.none, b)
Group.new("cucumberScenario", c.hue_3, c.none, b)
Group.new("cucumberScenarioOutline", c.hue_3, c.none, b)
Group.new("cucumberTags", c.mono_3, c.none, b)
Group.new("cucumberDelimiter", c.mono_3, c.none, b)

-- CSS/Sass
Group.new("cssAttrComma", c.hue_3, c.none, no)
Group.new("cssAttributeSelector", c.hue_4, c.none, no)
Group.new("cssBraces", c.mono_2, c.none, no)
Group.new("cssClassName", c.hue_6, c.none, no)
Group.new("cssClassNameDot", c.hue_6, c.none, no)
Group.new("cssDefinition", c.hue_3, c.none, no)
Group.new("cssFontAttr", c.hue_6, c.none, no)
Group.new("cssFontDescriptor", c.hue_3, c.none, no)
Group.new("cssFunctionName", c.hue_2, c.none, no)
Group.new("cssIdentifier", c.hue_2, c.none, no)
Group.new("cssImportant", c.hue_3, c.none, no)
Group.new("cssInclude", c.mono_1, c.none, no)
Group.new("cssIncludeKeyword", c.hue_3, c.none, no)
Group.new("cssMediaType", c.hue_6, c.none, no)
Group.new("cssProp", c.hue_1, c.none, no)
Group.new("cssPseudoClassId", c.hue_6, c.none, no)
Group.new("cssSelectorOp", c.hue_3, c.none, no)
Group.new("cssSelectorOp2", c.hue_3, c.none, no)
Group.new("cssStringQ", c.hue_4, c.none, no)
Group.new("cssStringQQ", c.hue_4, c.none, no)
Group.new("cssTagName", c.hue_5, c.none, no)
Group.new("cssAttr", c.hue_6, c.none, no)
Group.new("sassAmpersand", c.hue_5, c.none, no)
Group.new("sassClass", c.hue_6_2, c.none, no)
Group.new("sassControl", c.hue_3, c.none, no)
Group.new("sassExtend", c.hue_3, c.none, no)
Group.new("sassFor", c.mono_1, c.none, no)
Group.new("sassProperty", c.hue_1, c.none, no)
Group.new("sassFunction", c.hue_1, c.none, no)
Group.new("sassId", c.hue_2, c.none, no)
Group.new("sassInclude", c.hue_3, c.none, no)
Group.new("sassMedia", c.hue_3, c.none, no)
Group.new("sassMediaOperators", c.mono_1, c.none, no)
Group.new("sassMixin", c.hue_3, c.none, no)
Group.new("sassMixinName", c.hue_2, c.none, no)
Group.new("sassMixing", c.hue_3, c.none, no)
Group.new("scssSelectorName", c.hue_6_2, c.none, no)

-- Elixir highlighting

Group.new("elixirModuleDefine", g.Define, g.Define, g.Define)
Group.new("elixirAlias", c.hue_6_2, c.none, no)
Group.new("elixirAtom", c.hue_1, c.none, no)
Group.new("elixirBlockDefinition", c.hue_3, c.none, no)
Group.new("elixirModuleDeclaration", c.hue_6, c.none, no)
Group.new("elixirInclude", c.hue_5, c.none, no)
Group.new("elixirOperator", c.hue_6, c.none, no)

-- Git and git related plugins
Group.new("gitcommitComment", c.mono_3, c.none, no)
Group.new("gitcommitUnmerged", c.hue_4, c.none, no)
Group.new("gitcommitOnBranch", c.none, c.none, no)
Group.new("gitcommitBranch", c.hue_3, c.none, no)
Group.new("gitcommitDiscardedType", c.hue_5, c.none, no)
Group.new("gitcommitSelectedType", c.hue_4, c.none, no)
Group.new("gitcommitHeader", c.none, c.none, no)
Group.new("gitcommitUntrackedFile", c.hue_1, c.none, no)
Group.new("gitcommitDiscardedFile", c.hue_5, c.none, no)
Group.new("gitcommitSelectedFile", c.hue_4, c.none, no)
Group.new("gitcommitUnmergedFile", c.hue_6_2, c.none, no)
Group.new("gitcommitFile", c.none, c.none, no)
Group.new("gitcommitNoBranch", g.gitcommitBranch, g.gitcommitBranch, g.gitcommitBranch)
Group.new("gitcommitUntracked", g.gitcommitComment, g.gitcommitComment, g.gitcommitComment)
Group.new("gitcommitDiscarded", g.gitcommitComment, g.gitcommitComment, g.gitcommitComment)
Group.new("gitcommitDiscardedArrow", g.gitcommitDiscardedFile, g.gitcommitDiscardedFile, g.gitcommitDiscardedFile)
Group.new("gitcommitSelectedArrow", g.gitcommitSelectedFile, g.gitcommitSelectedFile, g.gitcommitSelectedFile)
Group.new("gitcommitUnmergedArrow", g.gitcommitUnmergedFile, g.gitcommitUnmergedFile, g.gitcommitUnmergedFile)
Group.new("SignifySignAdd", c.hue_4, c.none, no)
Group.new("SignifySignChange", c.hue_6_2, c.none, no)
Group.new("SignifySignDelete", c.hue_5, c.none, no)
Group.new("GitGutterAdd", g.SignifySignAdd, g.SignifySignAdd, g.SignifySignAdd)
Group.new("GitGutterChange", g.SignifySignChange, g.SignifySignChange, g.SignifySignChange)
Group.new("GitGutterDelete", g.SignifySignDelete, g.SignifySignDelete, g.SignifySignDelete)
Group.new("diffAdded", c.hue_4, c.none, no)
Group.new("diffRemoved", c.hue_5, c.none, no)

-- Go
Group.new("goDeclaration", c.hue_3, c.none, no)
Group.new("goField", c.hue_5, c.none, no)
Group.new("goMethod", c.hue_1, c.none, no)
Group.new("goType", c.hue_3, c.none, no)
Group.new("goUnsignedInts", c.hue_1, c.none, no)

-- Haskell highlighting
Group.new("haskellDeclKeyword", c.hue_2, c.none, no)
Group.new("haskellType", c.hue_4, c.none, no)
Group.new("haskellWhere", c.hue_5, c.none, no)
Group.new("haskellImportKeywords", c.hue_2, c.none, no)
Group.new("haskellOperators", c.hue_5, c.none, no)
Group.new("haskellDelimiter", c.hue_2, c.none, no)
Group.new("haskellIdentifier", c.hue_6, c.none, no)
Group.new("haskellKeyword", c.hue_5, c.none, no)
Group.new("haskellNumber", c.hue_1, c.none, no)
Group.new("haskellString", c.hue_1, c.none, no)

-- HTML
Group.new("htmlArg", c.hue_6, c.none, no)
Group.new("htmlTagName", c.hue_5, c.none, no)
Group.new("htmlTagN", c.hue_5, c.none, no)
Group.new("htmlTsTag", c.cRedBright, c.none, no)
Group.new("htmlTsText", c.cWhite, c.none, no)
Group.new("htmlSpecialTagName", c.hue_5, c.none, no)
Group.new("htmlTag", c.cPurple, c.none, no)
Group.new("htmlEndTag", c.mono_2, c.none, no)
Group.new("MatchTag", c.hue_5, c.syntax_cursor, ul + b)

-- JavaScript
Group.new("coffeeString", c.hue_4, c.none, no)
Group.new("javaScriptBraces", c.mono_2, c.none, no)
Group.new("javaScriptFunction", c.hue_3, c.none, no)
Group.new("javaScriptIdentifier", c.hue_3, c.none, no)
Group.new("javaScriptNull", c.hue_6, c.none, no)
Group.new("javaScriptNumber", c.hue_6, c.none, no)
Group.new("javaScriptRequire", c.hue_1, c.none, no)
Group.new("javaScriptReserved", c.hue_3, c.none, no)
-- httpc.//github.com/pangloss/vim-javascript
Group.new("jsArrowFunction", c.hue_3, c.none, no)
Group.new("jsBraces", c.mono_2, c.none, no)
Group.new("jsClassBraces", c.mono_2, c.none, no)
Group.new("jsClassKeywords", c.hue_3, c.none, no)
Group.new("jsDocParam", c.hue_2, c.none, no)
Group.new("jsDocTags", c.hue_3, c.none, no)
Group.new("jsFuncBraces", c.mono_2, c.none, no)
Group.new("jsFuncCall", c.hue_2, c.none, no)
Group.new("jsFuncParens", c.mono_2, c.none, no)
Group.new("jsFunction", c.hue_3, c.none, no)
Group.new("jsGlobalObjects", c.hue_6_2, c.none, no)
Group.new("jsModuleWords", c.hue_3, c.none, no)
Group.new("jsModules", c.hue_3, c.none, no)
Group.new("jsNoise", c.mono_2, c.none, no)
Group.new("jsNull", c.hue_6, c.none, no)
Group.new("jsOperator", c.hue_3, c.none, no)
Group.new("jsParens", c.mono_2, c.none, no)
Group.new("jsStorageClass", c.hue_3, c.none, no)
Group.new("jsTemplateBraces", c.hue_5_2, c.none, no)
Group.new("jsTemplateVar", c.hue_4, c.none, no)
Group.new("jsThis", c.hue_5, c.none, no)
Group.new("jsUndefined", c.hue_6, c.none, no)
Group.new("jsObjectValue", c.hue_2, c.none, no)
Group.new("jsObjectKey", c.hue_1, c.none, no)
Group.new("jsReturn", c.hue_3, c.none, no)
-- httpc.//github.com/othree/yajs.vim
Group.new("javascriptArrowFunc", c.hue_3, c.none, no)
Group.new("javascriptClassExtends", c.hue_3, c.none, no)
Group.new("javascriptClassKeyword", c.hue_3, c.none, no)
Group.new("javascriptDocNotation", c.hue_3, c.none, no)
Group.new("javascriptDocParamName", c.hue_2, c.none, no)
Group.new("javascriptDocTags", c.hue_3, c.none, no)
Group.new("javascriptEndColons", c.mono_3, c.none, no)
Group.new("javascriptExport", c.hue_3, c.none, no)
Group.new("javascriptFuncArg", c.mono_1, c.none, no)
Group.new("javascriptFuncKeyword", c.hue_3, c.none, no)
Group.new("javascriptIdentifier", c.hue_5, c.none, no)
Group.new("javascriptImport", c.hue_3, c.none, no)
Group.new("javascriptObjectLabel", c.mono_1, c.none, no)
Group.new("javascriptOpSymbol", c.hue_1, c.none, no)
Group.new("javascriptOpSymbols", c.hue_1, c.none, no)
Group.new("javascriptPropertyName", c.hue_4, c.none, no)
Group.new("javascriptTemplateSB", c.hue_5_2, c.none, no)
Group.new("javascriptVariable", c.hue_3, c.none, no)

-- JSON
Group.new("jsonCommentError", c.mono_1, c.none, no)
Group.new("jsonKeyword", c.hue_5, c.none, no)
Group.new("jsonQuote", c.mono_3, c.none, no)
Group.new("jsonTrailingCommaError", c.hue_5, c.none, r)
Group.new("jsonMissingCommaError", c.hue_5, c.none, r)
Group.new("jsonNoQuotesError", c.hue_5, c.none, r)
Group.new("jsonNumError", c.hue_5, c.none, r)
Group.new("jsonString", c.hue_4, c.none, no)
Group.new("jsonBoolean", c.hue_3, c.none, no)
Group.new("jsonNumber", c.hue_6, c.none, no)
Group.new("jsonStringSQError", c.hue_5, c.none, r)
Group.new("jsonSemicolonError", c.hue_5, c.none, r)

-- Markdown
Group.new("markdownBold", c.Yellow, c.none, b)
Group.new("markdownCode", c.cGreenDark, c.none, no)
Group.new("markdownCodeBlock", c.cOrange, c.none, no)
Group.new("markdownCodeDelimiter", c.cRedBright, c.none, no)
Group.new("markdownH1", c.cBlue, c.none, b)
Group.new("markdownH2", c.cBlue, c.none, b)
Group.new("markdownH3", c.cBlue, c.none, b)
Group.new("markdownH4", c.cBlue, c.none, no)
Group.new("markdownH5", c.cBlue, c.none, no)
Group.new("markdownH6", c.cBlue, c.none, no)
Group.new("markdownHeadingDelimiter", c.cGreen, c.none, no)
Group.new("markdownLinkText", c.cGreen, c.none, no)
Group.new("markdownItalic", c.hue_6, c.none, italics)
Group.new("markdownListMarker", c.hue_5, c.none, b)
Group.new("markdownUrl", c.mono_3, c.none, no)

-- PHP
--
Group.new("phpClass", c.hue_6_2, c.none, no)
Group.new("phpFunction", c.hue_2, c.none, no)
Group.new("phpFunctions", c.hue_2, c.none, no)
Group.new("phpInclude", c.hue_3, c.none, no)
Group.new("phpKeyword", c.hue_3, c.none, no)
Group.new("phpParent", c.mono_3, c.none, no)
Group.new("phpType", c.hue_3, c.none, no)
Group.new("phpSuperGlobals", c.hue_5, c.none, no)

-- Pug (Formerly Jade)
Group.new("pugAttributesDelimiter", c.hue_6, c.none, no)
Group.new("pugClass", c.hue_6, c.none, no)
Group.new("pugDocType", c.mono_3, c.none, italics)
Group.new("pugTag", c.hue_5, c.none, no)

-- PureScript
Group.new("purescriptKeyword", c.hue_3, c.none, no)
Group.new("purescriptModuleName", c.mono_1, c.none, no)
Group.new("purescriptIdentifier", c.mono_1, c.none, no)
Group.new("purescriptType", c.hue_6_2, c.none, no)
Group.new("purescriptTypeVar", c.hue_5, c.none, no)
Group.new("purescriptConstructor", c.hue_5, c.none, no)
Group.new("purescriptOperator", c.mono_1, c.none, no)

-- Python
Group.new("pythonImport", c.hue_3, c.none, b)
Group.new("pythonBuiltin", c.hue_1, c.none, no)
Group.new("pythonStatement", c.hue_3, c.none, b)
Group.new("pythonParam", c.hue_6, c.none, no)
Group.new("pythonEscape", c.hue_5, c.none, no)
Group.new("pythonSelf", c.mono_2, c.none, italics)
Group.new("pythonClass", c.hue_2, c.none, no)
Group.new("pythonOperator", c.hue_3, c.none, no)
Group.new("pythonEscape", c.hue_5, c.none, no)
Group.new("pythonFunction", c.hue_2, c.none, no)
Group.new("pythonKeyword", c.hue_2, c.none, no)
Group.new("pythonModule", c.hue_3, c.none, no)
Group.new("pythonStringDelimiter", c.hue_4, c.none, no)
Group.new("pythonSymbol", c.hue_1, c.none, no)

-- Ruby
Group.new("rubyBlock", c.hue_3, c.none, no)
Group.new("rubyBlockParameter", c.hue_5, c.none, no)
Group.new("rubyBlockParameterList", c.hue_5, c.none, no)
Group.new("rubyCapitalizedMethod", c.hue_3, c.none, no)
Group.new("rubyClass", c.hue_3, c.none, no)
Group.new("rubyConstant", c.hue_6_2, c.none, no)
Group.new("rubyControl", c.hue_3, c.none, no)
Group.new("rubyDefine", c.hue_3, c.none, no)
Group.new("rubyEscape", c.hue_5, c.none, no)
Group.new("rubyFunction", c.hue_2, c.none, no)
Group.new("rubyGlobalVariable", c.hue_5, c.none, no)
Group.new("rubyInclude", c.hue_2, c.none, no)
Group.new("rubyIncluderubyGlobalVariable", c.hue_5, c.none, no)
Group.new("rubyInstanceVariable", c.hue_5, c.none, no)
Group.new("rubyInterpolation", c.hue_1, c.none, no)
Group.new("rubyInterpolationDelimiter", c.hue_5, c.none, no)
Group.new("rubyKeyword", c.hue_2, c.none, no)
Group.new("rubyModule", c.hue_3, c.none, no)
Group.new("rubyPseudoVariable", c.hue_5, c.none, no)
Group.new("rubyRegexp", c.hue_1, c.none, no)
Group.new("rubyRegexpDelimiter", c.hue_1, c.none, no)
Group.new("rubyStringDelimiter", c.hue_4, c.none, no)
Group.new("rubySymbol", c.hue_1, c.none, no)

-- Spelling
Group.new("SpellBad", c.customSpell, c.none, uc)
Group.new("SpellLocal", c.mono_3, c.none, uc)
Group.new("SpellCap", c.mono_3, c.none, uc)
Group.new("SpellRare", c.mono_3, c.none, uc)

-- Vim
Group.new("vimCommand", c.hue_3, c.none, no)
Group.new("vimCommentTitle", c.mono_3, c.none, b)
Group.new("vimFunction", c.hue_1, c.none, no)
Group.new("vimFuncName", c.hue_3, c.none, no)
Group.new("vimHighlight", c.hue_2, c.none, no)
Group.new("vimLineComment", c.mono_3, c.none, italics)
Group.new("vimParenSep", c.mono_2, c.none, no)
Group.new("vimSep", c.mono_2, c.none, no)
Group.new("vimUserFunc", c.hue_1, c.none, no)
Group.new("vimVar", c.hue_5, c.none, no)

-- XML
Group.new("xmlAttrib", c.hue_6_2, c.none, no)
Group.new("xmlEndTag", c.hue_5, c.none, no)
Group.new("xmlTag", c.hue_5, c.none, no)
Group.new("xmlTagName", c.hue_5, c.none, no)

-- ZSH
Group.new("zshCommands", c.mono_1, c.none, no)
Group.new("zshDeref", c.hue_5, c.none, no)
Group.new("zshShortDeref", c.hue_5, c.none, no)
Group.new("zshFunction", c.hue_1, c.none, no)
Group.new("zshKeyword", c.hue_3, c.none, no)
Group.new("zshSubst", c.hue_5, c.none, no)
Group.new("zshSubstDelim", c.mono_3, c.none, no)
Group.new("zshTypes", c.hue_3, c.none, no)
Group.new("zshVariableDef", c.hue_6, c.none, no)

-- Rust
Group.new("rustExternCrate", c.hue_5, c.none, b)
Group.new("rustIdentifier", c.hue_2, c.none, no)
Group.new("rustDeriveTrait", c.hue_4, c.none, no)
Group.new("SpecialComment", c.mono_3, c.none, no)
Group.new("rustCommentLine", c.mono_3, c.none, no)
Group.new("rustCommentLineDoc", c.mono_3, c.none, no)
Group.new("rustCommentLineDocError", c.mono_3, c.none, no)
Group.new("rustCommentBlock", c.mono_3, c.none, no)
Group.new("rustCommentBlockDoc", c.mono_3, c.none, no)
Group.new("rustCommentBlockDocError", c.mono_3, c.none, no)

-- Typescript
Group.new("typescriptIdentifierName", c.pink, c.none, b)

-- Man
Group.new("manTitle", g.String, g.String, g.String)
Group.new("manFooter", c.mono_3, c.none, no)

-------------------------
-- Plugin Highlighting --
-------------------------

-- ALE (Asynchronous Lint Engine)
Group.new("ALEWarningSign", c.hue_6_2, c.none, no)
Group.new("ALEErrorSign", c.hue_5, c.none, no)

-- Neovim NERDTree Background fix
Group.new("NERDTreeFile", c.mono_1, c.none, no)

-- Coc.nvim Floating Background fix
Group.new("CocFloating", c.mono_1, c.none, no)
-- Group.new("NormalFloat", c.mono_1, c.pmenu, no)
-----------------------------
-- TreeSitter Highlighting --
-----------------------------
Group.new("TSAnnotation", c.hue_6_2, c.none, no)
Group.new("TSAttribute", c.hue_1, c.none, no)
Group.new("TSBoolean", c.hue_6, c.none, no)
Group.new("TSCharacter", c.hue_4, c.none, no)
Group.new("TSConditional", c.pink, c.none, no)
Group.new("TSConstBuiltin", c.hue_6, c.none, no)
Group.new("TSConstMacro", c.hue_1, c.none, no)
Group.new("TSConstant", c.hue_2, c.none, no)
Group.new("TSConstructor", c.hue_1, c.none, b)
Group.new("TSEmphasis", c.cOrange, c.none, b)
Group.new("TSError", c.hue_5, c.none, no)
Group.new("TSException", c.pink, c.none, no)
Group.new("TSField", c.hue_5, c.none, no)
Group.new("TSFloat", c.hue_4, c.none, no)
Group.new("TSFuncBuiltin", c.hue_2, c.none, no)
Group.new("TSFuncMacro", c.hue_6_2, c.none, no)
Group.new("TSFunction", c.hue_2, c.none, b)
Group.new("TSInclude", c.pink, c.none, b) -- imports
Group.new("TSIdentifier", c.pink, c.none, b) -- imports
Group.new("TSKeyword", c.pink, c.none, b)
Group.new("TSKeywordFunction", c.pink, c.none, b)
Group.new("TSKeywordOperator", c.pink, c.none, no)
Group.new("TSLabel", c.hue_2, c.none, no)
Group.new("TSLiteral", c.hue_6_2, c.none, no)
Group.new("TSMethod", c.hue_2, c.none, b)
Group.new("TSNamespace", c.pink, c.none, b)
Group.new("TSNumber", c.hue_6, c.none, no)
Group.new("TSOperator", c.mono_1, c.none, no)
Group.new("TSParameter", c.hue_1, c.none, no)
Group.new("TSParameterReference", c.hue_1, c.none, no)
Group.new("TSProperty", c.hue_6_2, c.none, b)
Group.new("TSPunctBracket", c.mono_1, c.none, no)
Group.new("TSPunctDelimiter", c.mono_1, c.none, no)
Group.new("TSPunctSpecial", c.mono_1, c.none, no)
Group.new("TSRepeat", c.pink, c.none, no)
Group.new("TSString", c.hue_4, c.none, no)
Group.new("TSStringEscape", c.hue_1, c.none, no)
Group.new("TSStringRegex", c.hue_4, c.none, no)
Group.new("TSStrong", c.corange, c.none, b)
Group.new("TSStructure", c.hue_6_2, c.none, no)
Group.new("TSTag", c.hue_5, c.none, no)
Group.new("TSTagDelimiter", c.mono_3, c.none, no)
Group.new("TSText", c.hue_6_2, c.none, no)
Group.new("TSTitle", c.cGreen, c.none, b)
Group.new("TSPunctSpecial", c.cPink, c.none, b)
Group.new("TSType", c.hue_2, c.none, b)
Group.new("TSTypeBuiltin", c.hue_2, c.none, no)
Group.new("TSURI", c.dHint, c.none, no)
Group.new("TSUnderline", c.hue_6_2, c.none, no)
Group.new("TSVariable", c.hue_1, c.none, no)
Group.new("TSVariableBuiltin", c.hue_6_2, c.none, b)
