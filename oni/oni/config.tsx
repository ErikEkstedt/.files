
import * as React from "/home/erik/oni/node_modules/react"
import * as Oni from "/home/erik/oni/node_modules/oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
    console.log("config activated")

    // Bindings
    oni.input.unbind("<C-p>")
    oni.input.unbind("<C-f>")
    oni.input.unbind("<C-c>")
    oni.input.unbind("<C-j>")
    oni.input.unbind("<C-k>")
    // oni.input.unbind("<s-enter>")

    oni.input.bind("<c-f>", "quickOpen.show")
    oni.input.bind("<f8>", "markdown.togglePreview")

    // Movement
    oni.input.bind("<C-j>", "menu.next")
    oni.input.bind("<C-k>", "menu.previous")
    oni.input.bind("<C-j>", "contextMenu.next")
    oni.input.bind("<C-k>", "contextMenu.previous")
    oni.input.bind("<tab>", "contextMenu.select")
}

export const deactivate = (oni: Oni.Plugin.Api) => {
    console.log("config deactivated")
}

export const configuration = {
    //add custom config here, such as


    // "oni.bookmarks": ["~/com_sci"],
    "oni.useDefaultConfig": true,
    // "oni.loadInitVim": "/home/erik/.files/nvim/init.vim",
    "oni.loadInitVim": false,
    "vim.setting.list": false,  // fixed tabs showing as ^I

    // Editor - where you write code
    "editor.fontSize": "16px",
	"editor.fontFamily": "DejaVu Sans Mono",
	// "editor.linePadding": "0.01", // weird behavior (default: 2)
    "editor.clipboard.enabled": false,
    "editor.clipboard.synchronizeYank": false,
    "editor.clipboard.synchronizeDelete": false,

	"editor.quickInfo.enabled": true,
	"editor.quickInfo.delay": 100,
	"editor.completions.mode": "oni",

	// Snippets
	"snippets.enabled": true,
	"snippets.userSnippetFolder": "/home/erik/.config/oni/snippets",

    // UI - where you interface
    "ui.colorscheme": "onedark", //monokai, nord
    "ui.fontSize": "14px"
    "ui.fontFamily": "Ubuntu",  
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",

    // Stausbar & Sidebar
    "sidebar.enabled": false, // (default: true)
    "statusbar.enabled": true,
    "statusbar.fontSize": "14px",

	// Preview
	// "experimental.markdownPreview.enabled": true,
	// "language.python.languageServer.command": "pyls",
}
