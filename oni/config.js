"use strict";
exports.__esModule = true;
exports.activate = function (oni) {
    console.log("config activated");
    oni.input.unbind("<c-p>");
    // oni.input.unbind("<c-f>")
    oni.input.unbind("<c-s>");
    // Movement
    oni.input.bind("<C-j>", "menu.next");
    oni.input.bind("<C-k>", "menu.previous");
    // autocomplete menu
    oni.input.bind("<C-j>", "contextMenu.next");
    oni.input.bind("<C-k>", "contextMenu.previous");
    oni.input.bind("<tab>", "contextMenu.select");
    // oni.input.bind("<C-f>", "workspace.openFolder")
    // oni.input.bind("<C-f>", "quickOpen")
    oni.input.bind("<C-f>", "quickOpen.show");
    oni.input.bind("<s-c-r>", "language.findAllReferences");
    // oni. input.bind("<c-p>", "quickOpen.show", () => isNormalMode() && !isMenuOpen())
}; // }}}
exports.deactivate = function (oni) {
    console.log("config deactivated");
}; // }}}
exports.configuration = {
    // Experimental
    "snippets.enabled": true,
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
    "editor.fontSize": "15px", "editor.linePadding": 0,
    "editor.clipboard.enabled": false,
    "editor.clipboard.synchronizeYank": false,
    "editor.clipboard.synchronizeDelete": false,
    "editor.completions.mode": "oni",
    "editor.quickInfo.delay": 200,
    // "editor.completions.mode": "hidden", 
    "editor.cursorLine": true,
    "editor.cursorLineOpacity": 0.5,
    // // UI customizations ---------
    // "ui.colorscheme": "onedark",
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",
    "ui.fontSize": "14px"
    // // plugins
    ,
    // // plugins
    "sidebar.enabled": false,
    "statusbar.fontSize": "14px",
    "language.python.languageServer.command": "pyls",
    "environment.additionalPaths": [
        "/home/erik/miniconda3/bin",
    ]
}; // }}}
