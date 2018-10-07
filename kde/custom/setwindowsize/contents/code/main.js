function centerCurrentWindow() {
    // Get the current window
    var currentWin = workspace.activeClient;
    
    // The workspace.workspace[Width,Height] values will change depending on the
    // number of workspaces and the desktop grid orientation, so we need to
    // divide the width and height by the desktop gridge width/height.
    wsWidth = (workspace.workspaceWidth / workspace.desktopGridWidth);
    wsHeight = (workspace.workspaceHeight / workspace.desktopGridHeight);
    
    // We set the window geometry for the current window providing the x, y, width
    // and height all at once. We divide the individual workspace width/height in
    // half and then subtract half the window size to be able to center the window.
    currentWin.geometry = {
        x: (wsWidth / 2) - (currentWin.width / 2),
        y: (wsHeight / 2) - (currentWin.height / 2),
        width: currentWin.width,
        height: currentWin.height
    }
}

if (registerShortcut) {
    registerShortcut("Center Current Window",
        "Center Current Window",
        "",
        function() { centerCurrentWindow(); }
    );
}

