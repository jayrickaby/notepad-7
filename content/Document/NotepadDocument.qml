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
        if (textDocument.source === "" || textDocument.source === undefined) {
            // FIXME: Why aren't I happening??
            console.log("Prompting save file location...")
            saveFileLocationDialog.open()
        }
        else {
            textDocument.save()
            resetDocument()
        }
        console.log("Invoked save.")
    }

    function resetDocument() {
        clear()
        textDocument.source = ""
        textDocument.text = ""
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
        nameFilters: ["Text Documents (*.txt)", "All Files"]
        fileMode: FileDialog.SaveFile
        onAccepted: {
            textDocument.saveAs(selectedFile)
            resetDocument()
        }
    }
}