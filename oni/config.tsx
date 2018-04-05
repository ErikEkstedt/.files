
import * as React from "/home/erik/oni/node_modules/react"
import * as Oni from "/home/erik/oni/node_modules/oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
    console.log("config activated")

	// Bindings
    oni.input.unbind("<c-p>")
    oni.input.unbind("<c-f>")
    oni.input.unbind("<s-enter>")
	oni.input.bind("<c-f>", "quickOpen.show")

	// Movement
	oni.input.bind("<C-j>", "contextMenu.next")
    oni.input.bind("<C-k>", "contextMenu.previous")
    oni.input.bind("<C-j>", "menu.next")
    oni.input.bind("<C-k>", "menu.previous")
    oni.input.bind("<tab>", "contextMenu.select")

}

export const deactivate = (oni: Oni.Plugin.Api) => {
    console.log("config deactivated")
}

export const configuration = {
    //add custom config here, such as
    // "oni.useDefaultConfig": false,
    // "oni.useDefaultConfig": false,
    // "onij
    "oni.bookmarks": ["~/com_sci", "~/com_sci/web-projects/blog"],
    // "oni.loadInitVim": "/home/erik/.files/nvim/init.vim",  // load user init
    "oni.loadInitVim": true,
    "oni.useExternalPopupMenu": true,
    
    // UI customizations
    "ui.colorscheme": "onedark", // "nord",
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",

    // Editor customizations
    "editor.fontSize": "16px",
    "editor.fontFamily": "DejaVuSansMono Nerd Font Mono",
    "editor.clipboard.enabled": false,
    "editor.clipboard.synchronizeYank": false,
    "editor.clipboard.synchronizeDelete": false,

    "experimental.preview.enabled": true,
    "language.python.languageServer.command": "pyls",
}
