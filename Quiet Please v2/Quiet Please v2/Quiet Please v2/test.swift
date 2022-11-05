func selectDir() {
    let dialog = NSOpenPanel();

    dialog.title                   = "Choose single directory | Our Code World";
    dialog.showsResizeIndicator    = true;
    dialog.showsHiddenFiles        = false;
    dialog.canChooseFiles = false;
    dialog.canChooseDirectories = true;

    if (dialog.runModal() ==  NSApplication.ModalResponse.OK) {
        let result = dialog.url

        if (result != nil) {
            let path: String = result!.path
            
            // path contains the directory path e.g
            // /Users/ourcodeworld/Desktop/folder
        }
    } else {
        // User clicked on "Cancel"
        return
    }
}

selectDir()