
import * as React from "/opt/Oni/resources/app/node_modules/react"
import * as Oni from "/opt/Oni/resources/app/node_modules/oni-api"

export const activate = (oni: Oni.Plugin.Api) => { // {{{
    console.log("config activated")

    // UNBINDS
    oni.input.unbind("<c-p>")
    oni.input.unbind("<c-f>")
    oni.input.unbind("<c-t>")
    oni.input.unbind("<c-s>")

    // Movement
    oni.input.bind("<C-j>", "menu.next")
    oni.input.bind("<C-k>", "menu.previous")

    // autocomplete menu
    oni.input.bind("<C-j>", "contextMenu.next")
    oni.input.bind("<C-k>", "contextMenu.previous")
    oni.input.bind("<tab>", "contextMenu.select")

    oni.input.bind("<C-ö>", "quickOpen.show")
    oni.input.bind("<s-c-r>", "language.findAllReferences")

    // tools
    // oni. input.bind("<c-p>", "quickOpen.show", () => isNormalMode() && !isMenuOpen())
} // }}}

export const deactivate = (oni: Oni.Plugin.Api) => { //{{{
    console.log("config deactivated")
} // }}}

export const configuration = { //{{{

    // // UI customizations ---------
    "ui.colorscheme": "monokai",
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",
    "ui.fontSize": "16px"

    // // plugins
    "sidebar.enabled": true,
    "sidebar.default.open": false,
    "statusbar.fontSize": "16px",

    // Experimental
    "snippets.enabled": true,
    "experimental.preview.enabled": true,

    // Settings
    "autoClosingPairs.enabled": false,
    "autoUpdate.enabled": false,

    "oni.loadInitVim": true,

    // Editor
    "editor.fontSize": "20px",
    "editor.linePadding": 0,
    "editor.clipboard.enabled": true,
    "editor.clipboard.synchronizeYank": false,
    "editor.clipboard.synchronizeDelete": false,
    "editor.quickInfo.delay": 200,
    "editor.cursorLine": true,
    "editor.cursorLineOpacity": 0.5,
    "editor.textMateHighlighting.enabled": true,

    "workspace.defaultWorkspace": "/home/erik",
    "environment.additionalPaths": [
        "/usr/bin/",
        "/home/erik/miniconda3/bin",
        "/home/erik/.node_modules_global"
    ],
} // }}}
