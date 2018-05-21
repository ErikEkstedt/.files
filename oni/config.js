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
    "experimental.preview.enabled": true,
    // Settings
    // "autoClosingPairs.enabled": true,
    "autoUpdate.enabled": true,
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
    ,
    // // plugins
    "sidebar.enabled": false,
    "statusbar.fontSize": "14px",
    // "language.python.languageServer.command": "pyls",
    "language.python.languageServer.command": "/home/erik/miniconda3/bin/pyls",
    "environment.additionalPaths": [
        "/usr/bin/",
        "/home/erik/miniconda3/bin",
        "/home/erik/.node_modules_global/bin",
        "/home/erik/.node_modules_global"
    ]
}; // }}}
