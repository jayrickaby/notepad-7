import QtQuick
import QtQuick.Dialogs

TextEdit {
    property bool cancelOperation: false

    function invokeCreate() {
        console.log("Creating new file...")

        cancelOperation = false

        if (isModified()) {
            console.log("Prompting to save current file...")
            promptSave()
            return
        }

        resetDocument()
    }

    function invokeSave() {
        console.log("Invoking save...")
        if (textDocument.source === Qt.resolvedUrl("")) {
            console.log("Prompting save file location...")
            saveFileLocationDialog.open()
        }
        else {
            textDocument.save()
            resetDocument()
        }
        // Sometimes it doesn't change
        //textDocument.modified = false
        console.log("Invoked save.")
    }

    function resetDocument() {
        // Source reset first as clear() triggers modified state
        textDocument.source = ""
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
                    resetDocument()
                    break
            }
        }
    }

    FileDialog {
        id: saveFileLocationDialog
        // FIXME: Why not saving at txt?
        nameFilters: ["Text Documents (*.txt)", "All Files"]
        fileMode: FileDialog.SaveFile
        onAccepted: {
            textDocument.saveAs(selectedFile)
            resetDocument()
        }
    }
}