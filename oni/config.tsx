
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
	// "snippets.enabled": false,
    // "experimental.particles.enabled": false,
    // "experimental.preview.enabled": true,
    // "experimental.welcome.enabled": false,

    // Settings
    // "autoClosingPairs.enabled": true,
    "autoUpdate.enabled": true,
    // "autoClosingPairs.enabled": true,

    // "oni.useDefaultConfig": false,
    "oni.loadInitVim": true,
	// // "oni.hideMenu": false, // hide the gui menu (i have menu in os top bar so does not matter) 

    // // Editor
    "editor.fontSize": "12px",
	"editor.linePadding": 0,
    "editor.clipboard.enabled": false,
    "editor.clipboard.synchronizeYank": false,
    "editor.clipboard.synchronizeDelete": false,
	"editor.completions.mode": "oni", 
	// "editor.completions.mode": "hidden", 

    "editor.cursorLine": true,
    "editor.cursorLineOpacity": 0.5,

    // // UI customizations ---------
    // "ui.colorscheme": "onedark",
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",
    "ui.fontSize": "14px"

    // // plugins
    "sidebar.enabled": false, 
    "statusbar.fontSize": "14px",


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
