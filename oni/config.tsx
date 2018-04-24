
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
    oni.input.bind("<C-f>", "quickOpen")
    oni.input.bind("<s-c-r>", "language.findAllReferences")
} // }}}

export const deactivate = (oni: Oni.Plugin.Api) => { //{{{
    console.log("config deactivated")
} // }}}

export const configuration = { //{{{

    // Experimental
	"snippets.enabled": false,
    "experimental.particles.enabled": false,
    "experimental.preview.enabled": true,
    "experimental.welcome.enabled": false,

    // Settings
    "autoClosingPairs.enabled": true,
    "autoUpdate.enabled": true,
    "autoClosingPairs.enabled": true,

    "oni.useDefaultConfig": false,
    "oni.loadInitVim": true,
	"oni.hideMenu": false, // hide the gui menu (i have menu in os top bar so does not matter) 


	// could effect LSP
    "environment.additionalPaths": ['/home/erik/miniconda3/envs/oni-env/bin'], 
	
    // Editor
    "editor.fontSize": "16px",
	"editor.linePadding": 0,
    "editor.clipboard.enabled": false,
    "editor.clipboard.synchronizeYank": false,
    "editor.clipboard.synchronizeDelete": false,
	// "editor.completions.mode": "oni", 
	"editor.completions.mode": "hidden", 

    "editor.cursorLine": true,
    "editor.cursorLineOpacity": 0.5,
    "editor.backgroundOpacity": 0.5,
    "editor.scrollBar.visible": true,
    "editor.scrollBar.cursorTick.visible": true,
    "editor.textMateHighlighting.enabled": true,

    // UI customizations ---------
    "ui.colorscheme": "onedark",
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",
    "ui.fontSize": "16px"

    // plugins
    "sidebar.enabled": false, 
    "statusbar.fontSize": "16px",

    // Colors ------------------{{{
    
    // "colors.tabs.background": "#000000",
    // "colors.tabs.foreground": "#000000",
    
    // "colors.toolTip.background": "#000000",
    // "colors.toolTip.foreground": "#000000",
    // "colors.toolTip.border": "#aa0000",

    // "colors.editor.hover.title.background": "#241234",
    // "colors.editor.hover.title.foreground": "#aa0000",
    "colors.editor.hover.border": "#000000",
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
    // all config options "reference" {{{
    //
    // "oni.audio.bellUrl": null,
    // "oni.useDefaultConfig": true,
    // "oni.enhancedSyntaxHighlighting": true,
    // "oni.loadInitVim": false,
    // "oni.hideMenu": false,
    // "oni.exclude": [
    //     "node_modules",
    //     ".git"
    // ],
    // "oni.bookmarks": [],

    // "browser.defaultUrl": "https://duckduckgo.com",
    // "configuration.editor": "typescript",

    // // Debug
    // "debug.fixedSize": null,
    // "debug.neovimPath": null,
    // "debug.persistOnNeovimExit": false,
    // "debug.detailedSessionLogging": false,
    // "debug.showTypingPrediction": false,
    // "debug.showNotificationOnError": false,
    // "debug.fakeLag.languageServer": null,
    // "debug.fakeLag.neovimInput": null,

    // "wildmenu.mode": true,
    // "commandline.mode": true,
    // "commandline.icons": true,

    // "experimental.particles.enabled": false,
    // "experimental.preview.enabled": false,
    // "experimental.welcome.enabled": false,

    // "experimental.neovim.transport": "stdio",
    // "editor.maxLinesForLanguageServices": 2500,
    // "editor.textMateHighlighting.enabled": true,
    // "autoClosingPairs.enabled": true,
    // "autoClosingPairs.default": [
    //     {
    //         "open": "{",
    //         "close": "}"
    //     },
    //     {
    //         "open": "[",
    //         "close": "]"
    //     },
    //     {
    //         "open": "(",
    //         "close": ")"
    //     }
    // ],
    // "editor.backgroundOpacity": 1,
    // "editor.backgroundImageUrl": null,
    // "editor.backgroundImageSize": "cover",
    // "editor.clipboard.enabled": true,
    // "editor.clipboard.synchronizeYank": true,
    // "editor.clipboard.synchronizeDelete": false,
    // "editor.definition.enabled": true,
    // "editor.quickInfo.enabled": true,
    // "editor.quickInfo.delay": 500,
    // "editor.completions.mode": "oni",
    // "editor.errors.slideOnFocus": true,
    // "editor.formatting.formatOnSwitchToNormalMode": false,
    // "editor.fontLigatures": true,
    // "editor.fontSize": "12px",
    // "editor.fontFamily": "DejaVu Sans Mono",
    // "editor.linePadding": 2,
    // "editor.quickOpen.execCommand": null,
    // "editor.quickOpen.filterStrategy": "regex",
    // "editor.split.mode": "native",
    // "editor.typingPrediction": true,
    // "editor.scrollBar.visible": true,
    // "editor.scrollBar.cursorTick.visible": true,
    // "editor.fullScreenOnStart": false,
    // "editor.maximizeScreenOnStart": false,
    // "editor.cursorLine": true,
    // "editor.cursorLineOpacity": 0.1,
    // "editor.cursorColumn": false,
    // "editor.cursorColumnOpacity": 0.1,
    // "editor.tokenColors": [],
    // "editor.imageLayerExtensions": [
    //     ".gif",
    //     ".jpg",
    //     ".jpeg",
    //     ".bmp",
    //     ".png"
    // ],
    // "environment.additionalPaths": [
    //     "/usr/bin",
    //     "/usr/local/bin"
    // ], // }}}
} // }}}
