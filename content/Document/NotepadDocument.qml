import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

// TODO: Adjust style of scrollbars
ScrollView {
    property alias textArea: textArea
    property alias textDocument: textArea.textDocument
    property var pendingOperation: null
    property int currentLine: 1

    ScrollBar.horizontal.policy: {textArea.wrapMode === Text.NoWrap ? ScrollBar.AlwaysOn : ScrollBar.AlwaysOff}
    ScrollBar.vertical.policy: ScrollBar.AlwaysOn

    TextArea {
        id: textArea

        property bool hasSelection: false

        wrapMode: TextEdit.NoWrap
        font.family: "Lucida Console"
        font.pointSize: 10
        font.letterSpacing: 0.18
        renderType: Text.NativeRendering

        leftPadding: 3
        topPadding: 2

        MessageDialog {
            id: saveFilePrompt
            buttons: MessageDialog.Save | MessageDialog.Discard | MessageDialog.Cancel
            title: window.appTitle
            text: "Do you want to save changes to " + getFormalFileName() + "?"

            onButtonClicked: function(button, role) {
                switch (button) {
                    case MessageDialog.Save:
                        if (textDocument.source === Qt.resolvedUrl("")) {
                            console.log("Prompting save file location...")
                            invokeSaveAs()
                            return
                        }
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
                handlePendingOperation()
            }
        }


        FileDialog {
            id: saveFileLocationDialog
            title: "Save As"
            defaultSuffix: "txt"
            nameFilters: ["Text Documents (*.txt)", "All Files"]
            fileMode: FileDialog.SaveFile
            onAccepted: {
                textDocument.saveAs(selectedFile)
                handlePendingOperation()
            }
            onRejected: {
                pendingOperation = null
            }
        }

        FileDialog {
            id: loadFileLocationDialog
            title: "load"
            nameFilters: ["Text Documents (*.txt)", "All Files"]
            onAccepted: {
                load(selectedFile)
            }

            onVisibleChanged: {
                if (visible === true) {
                    if (textDocument.source !== Qt.resolvedUrl("")) {
                        console.log("Setting load file dialog selected file to: \"" + textDocument.source + "\"")
                        selectedFile = textDocument.source
                        currentFolder = getParentFolder(textDocument.source)
                        return
                    }
                    console.log("Setting load file dialog current folder to: \"" + window.documentsFolder + "\"")
                    currentFolder = window.documentsFolder
                }
            }
        }

        textDocument.onSourceChanged: {
            console.log("Source changed to \"" + textDocument.source + "\"")
            window.updateTitle(getFormalFileName())
        }

        onSelectionStartChanged: {
            hasSelection = isSelectionValid()
            let textUpToCursor = text.substring(0, cursorSelection.selectionStart);
            let lines = textUpToCursor.split("\n")
            currentLine = lines.length
        }

        onSelectionEndChanged: {
            hasSelection = isSelectionValid()
        }
    }

    function invokeCreate() {
        console.log("Creating new file...")

        handleChanges(function() {
            resetDocument()
        })
    }

    function invokeSave() {
        console.log("Invoking save...")

        textDocument.save()

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
        textArea.clear()

        // Directly override due to above
        textDocument.modified = false
    }
    function isModified() {
        console.log("Current file modified: " + textDocument.modified)
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

    function goToLine(target) {
        if (target < 1 || target > textArea.lineCount) {
            return false
        }

        var lines = textArea.text.split("\n");
        var targetPos = 0

        for (var i = 0; i < target - 1; i++) {
            targetPos += lines[i].length + 1
        }

        textArea.cursorPosition = targetPos

        return true
    }

    function setWrapMode(mode) {
        textArea.wrapMode = mode

        // Refresh document
        let temp = textArea.text
        textArea.text = ""
        textArea.text = temp
    }

    function getParentFolder(url) {
        return Qt.resolvedUrl(url.toString().substring(0, url.toString().lastIndexOf("/")))
    }
     function handlePendingOperation() {
            if (pendingOperation) {
                let operation = pendingOperation
                pendingOperation = null
                operation()
            }
        }

        function getSelection() {
            return ([
                textArea.cursorSelection.selectionStart,
                textArea.cursorSelection.selectionEnd
            ])
        }

        function isSelectionValid() {
            let sel = getSelection()
            return (sel[0] !== sel[1])
        }
}