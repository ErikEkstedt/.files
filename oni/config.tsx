
import * as React from "/opt/Oni/resources/app/node_modules/react"
import * as Oni from "/opt/Oni/resources/app/node_modules/oni-api"

export const activate = (oni: Oni.Plugin.Api) => { // {{{
    console.log("config activated")

    oni.input.unbind("<c-p>")
    // oni.input.unbind("<c-f>")
    oni.input.unbind("<c-s>")

    // Movement
    oni.input.bind("<C-j>", "menu.next")
    oni.input.bind("<C-k>", "menu.previous")

    // autocomplete menu
    oni.input.bind("<C-j>", "contextMenu.next")
    oni.input.bind("<C-k>", "contextMenu.previous")
    oni.input.bind("<tab>", "contextMenu.select")

    // oni.input.bind("<C-f>", "workspace.openFolder")
    // oni.input.bind("<C-f>", "quickOpen")
    oni.input.bind("<C-f>", "quickOpen.show")
    oni.input.bind("<s-c-r>", "language.findAllReferences")

	// oni. input.bind("<c-p>", "quickOpen.show", () => isNormalMode() && !isMenuOpen())
} // }}}

export const deactivate = (oni: Oni.Plugin.Api) => { //{{{
    console.log("config deactivated")
} // }}}

export const configuration = { //{{{

    // Experimental
	"snippets.enabled": true,
    "experimental.preview.enabled": true,
    // "experimental.particles.enabled": false,
    // "experimental.welcome.enabled": false,

    // Settings
    // "autoClosingPairs.enabled": true,
    "autoUpdate.enabled": true,

    // "oni.useDefaultConfig": false,
    "oni.loadInitVim": true,
	// // "oni.hideMenu": false, // hide the gui menu (i have menu in os top bar so does not matter) 

    "workspace.defaultWorkspace": "/home/erik/blog",

    // // Editor
    "editor.fontSize": "15px", "editor.linePadding": 1,
    "editor.clipboard.enabled": false,
    "editor.clipboard.synchronizeYank": false,
    "editor.clipboard.synchronizeDelete": false,
    "editor.quickInfo.delay": 200,
    "editor.split.mode": 'oni',
	// "editor.completions.mode": "oni", 
    "editor.cursorLine": true,
    "editor.cursorLineOpacity": 0.5,

    "language.html.languageServer.command": "/opt/Oni/resources/app/node_modules/vscode-html-languageserver-bin/htmlServerMain.js",
    "language.html.languageServer.arguments": [
    "--stdio"
    ],
    
    // // UI customizations ---------
    // "ui.colorscheme": "onedark",
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",
    "ui.fontSize": "14px"

    // // plugins
    "sidebar.enabled": false, 
    "statusbar.fontSize": "14px",
    // "language.python.languageServer.command": "pyls",
    "language.python.languageServer.command": "/home/erik/miniconda3/bin/pyls",

    "environment.additionalPaths": [
        "/usr/bin/",
        "/home/erik/miniconda3/bin",
        "/home/erik/.node_modules_global/bin"
    ],

    // Colors ------------------{{{
    
    // "colors.tabs.background": "#000000",
    // "colors.tabs.foreground": "#000000",
    
    // "colors.toolTip.background": "#000000",
    // "colors.toolTip.foreground": "#000000",
    // "colors.toolTip.border": "#aa0000",

    // "colors.editor.hover.title.background": "#241234",
    // "colors.editor.hover.title.foreground": "#aa0000",
    // "colors.editor.hover.border": "#000000",
    // "colors.editor.hover.contents.background": "#aa0000",
    // "colors.editor.hover.contents.foreground": "#000000",
    // "colors.editor.hover.contents.codeblock.background": "#000000",
    // "colors.editor.hover.contents.codeblock.foreground": "#000000",
    
    // "colors.contextMenu.background": "#000000",
    // "colors.contextMenu.foreground": "#000000",
    // "colors.contextMenu.border": "#aaaaaa",
    // "colors.contextMenu.highlight": "#000000",
    
    // "colors.menu.background": "#151515",
    // "colors.menu.foreground": "#aaaaaa",
    // "colors.menu.border": "#aaaaaa",
    // "colors.menu.highlight": "#aaaaaa",
    // }}}

} // }}}
