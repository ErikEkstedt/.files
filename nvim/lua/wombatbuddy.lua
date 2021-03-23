local Color, colors, Group, groups, styles = require('colorbuddy').setup()

Color.new('white',     '#f6f3e8')
Color.new('red',       '#f08080')
Color.new('dark_red',  '#cd0000')
Color.new('pink',      '#f080b8')
Color.new('neon_pink', '#f15bf1')
Color.new('green',     '#95e454')
Color.new('dark_green','#09a700')
Color.new('yellow',    '#f8fe7a')
Color.new('blue',      '#8ac6f2')
Color.new('aqua',      '#93a2cc')
Color.new('cyan',      '#53dccd')
Color.new('purple',    '#a7a7d1')
Color.new('violet',    '#b294bb')
Color.new('orange',    '#FF8706')
Color.new('brown',     '#a3685a')
Color.new('seagreen',  '#698b69')
Color.new('turquoise', '#698b69')
Color.new('comment', '#99968b')
Color.new('background', '#222222')
Color.new('nontext', '#393939')
Color.new('backgroundNC', '#191919')

-- Standard
Group.new('Normal', colors.white, colors.background)
-- Group.new('CursorLine', colors.white, colors.background:light())
Group.new('CursorLineNr', colors.blue)
Group.new('Cursor', colors.white, colors.black)
Group.new('NormalNC', colors.white:dark(), colors.backgroundNC)
Group.new('VertSplit', colors.blue, colors.background)
Group.new('Comment', colors.comment, nil, styles.italic)
Group.new('Whitespace', colors.nontext, nil)
Group.new('Folded', colors.aqua, nil)
Group.new('EndOfBuffer', nil, nil)
Group.new('SignColumn', nil, nil)
Group.new('LineNr', colors.comment, nil)

-- Diff
Group.new('DiffAdd', nil, colors.dark_green)
Group.new('DiffChange', nil, colors.orange)
Group.new('DiffDelete', nil, colors.dark_red)

-- Vim
Group.new('vimiscommand', colors.pink)
Group.new('vimlet', colors.pink)

-- Python
Group.new('pythonInclude', colors.blue)
Group.new('pythonStatement', colors.blue, nil, styles.bold)
Group.new('pythonFunction', colors.green:dark())
Group.new('pythonSelf', colors.yellow, nil, styles.bold)
Group.new('pythonattribute', colors.white)

-- Js/Jsx
Group.new('jsArrow', colors.yellow)
Group.new('jsBuiltinValues', colors.neon_pink)
Group.new('jsClass', colors.blue)
Group.new('jsClassName', colors.green)
Group.new('jsElse', colors.neon_pink)
Group.new('jsFunction', colors.blue, nil, styles.bold)
Group.new('jsFunctionCall', colors.blue)
Group.new('jsFunctionname', colors.green:dark(), nil, styles.bold)
Group.new('jsIdentifier', colors.yellow)
Group.new('jsIf', colors.neon_pink)
Group.new('jsImport', colors.blue)
Group.new('jsReturn', colors.neon_pink)
Group.new('jsModuleName', colors.yellow, nil, styles.bold)
Group.new('jsVariableType', colors.pink)
Group.new('jsxAttrib', colors.orange)
Group.new('jsThis', colors.yellow)
Group.new('jsExtends', colors.cyan)

-- CSS
Group.new('cssClassName', colors.blue, nil, styles.bold)
Group.new('cssTagName', colors.green, nil, styles.bold)
Group.new('cssPseudoClassId', colors.green)

-- semshi
Group.new('semshiImported', colors.yellow:dark(), nil, styles.bold)
Group.new('semshiGlobal', colors.aqua:dark(), nil, styles.bold)

-- Vimwiki
Group.new('VimwikiHeader1', colors.neon_pink)
Group.new('VimwikiHeader2', colors.blue)
Group.new('VimwikiHeader3', colors.blue)
Group.new('VimwikiHeaderChar', colors.aqua)
Group.new('vimwikibold', colors.yellow)
Group.new('VimwikiHR', colors.neon_pink)
