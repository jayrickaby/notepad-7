import QtQuick
import QtQuick.Dialogs

TextEdit {
        property var pendingOperation: null

    function invokeCreate() {
        console.log("Creating new file...")

        handleChanges(function() {
            resetDocument()
        })
    }

    function invokeSave() {
        console.log("Invoking save...")
        if (textDocument.source === Qt.resolvedUrl("")) {
            console.log("Prompting save file location...")
            invokeSaveAs()
        }
        else {
            textDocument.save()
        }
        console.log("Invoked save.")
    }

    function invokeSaveAs() {
        saveFileLocationDialog.open()
    }

    function invokeLoad() {
        console.log("Invoking load...")
        loadFileLocationDialog.open()
    }

    function handleChanges(callback) {
        if (!isModified()) {
            callback()
            return
        }

        console.log("Prompting to save \"" + textDocument.source + "\"...")
        pendingOperation = callback
        promptSave()
    }

    function resetDocument() {
        // Source reset first as clear() triggers modified state
        textDocument.source = Qt.resolvedUrl("")
        clear()

        // Directly override due to above
        textDocument.modified = false
    }
    function isModified() {
        console.log("Current file is modified.")
        return textDocument.modified
    }

    function promptSave() {
        saveFilePrompt.open()
        console.log("Prompted to save current file.")
    }

    function load(url) {
        handleChanges(function() {
            console.log(url)
            textDocument.source = url
        })
    }

    function getFormalFileName() {
        if (textDocument.source === Qt.resolvedUrl("")) {
            return "Untitled"
        }
        var filename = textDocument.source.toString().split('/').pop()
        return filename
    }

    MessageDialog {
        id: saveFilePrompt
        buttons: MessageDialog.Save | MessageDialog.Discard | MessageDialog.Cancel
        text: "modified"

        onButtonClicked: function(button, role) {
            switch (button) {
            case MessageDialog.Save:
                invokeSave()
                break
            case MessageDialog.Discard:
                // Won't change source otherwise
                textDocument.modified = false
                break
            case MessageDialog.Cancel:
                pendingOperation = null
                break
            }

            if (pendingOperation) {
                let operation = pendingOperation
                pendingOperation = null
                operation()
            }
        }
    }

    FileDialog {
        id: saveFileLocationDialog
        title: "save"
        defaultSuffix: "txt"
        nameFilters: ["Text Documents (*.txt)", "All Files"]
        fileMode: FileDialog.SaveFile
        onAccepted: {
            textDocument.saveAs(selectedFile)
        }
    }

    FileDialog {
        id: loadFileLocationDialog
        title: "load"
        nameFilters: ["Text Documents (*.txt)", "All Files"]
        onAccepted: {
            load(selectedFile)
        }
    }

    textDocument.onStatusChanged: {
            console.log("Document status: " + textDocument.status)
        if (textDocument.status === TextDocument.Loaded)
            window.updateTitle(getFormalFileName())
    }
}