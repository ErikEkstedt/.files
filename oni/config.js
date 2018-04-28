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
    "oni.hideMenu": false,
    // could effect LSP
    "environment.additionalPaths": ['/home/erik/miniconda3/envs/oni-env/bin'],
    // Editor
    "editor.fontSize": "14px",
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
    ,
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
    "colors.editor.hover.border": "#000000"
}; // }}}
