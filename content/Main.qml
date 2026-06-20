import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Layouts
import QtQuick.Window

import "Document"
import "Toolbar"

ApplicationWindow {
    id: window

    readonly property url baseUrl: Qt.resolvedUrl("../")
    readonly property url assetsUrl: Qt.resolvedUrl("../content/Aero7/assets/")
    readonly property url documentsFolder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)

    property string appTitle: "Notepad–7"

    width: 640
    height: 480
    visible: true

    header: MenuBar {
        id: menu
        height: 19

        FileMenu {}
        EditMenu {
            id: editMenu
        }
        FormatMenu {}
        HelpMenu {}
        ViewMenu {}
    }

    NotepadDocument {
        id: document
        anchors.fill: parent
    }

    MessageDialog {
        id: saveChangesMessage
        title: appTitle
        buttons: MessageDialog.Save | MessageDialog.Discard | MessageDialog.Cancel
    }

    function updateTitle(filename) {
        console.log("Updating title with: \"" + filename + "\"")
        title = (filename + " - " + appTitle)
    }

    // DOCUMENT BRIDGE FUNCTIONS
    // AS CANT DIRECTLY ACCESS COMPONENTS FROM OTHER COMPONENTS

    function createNewFile() {
        document.invokeCreate()
    }

    function saveCurrentFile() {
        document.invokeSave()
    }

    function saveCurrentFileAs() {
        document.invokeSaveAs()
    }

    function loadFile() {
        document.invokeLoad()
    }

    function undoText() {
        if (document.canUndo){
            document.undo()
        }
    }

    function cutText() {
        if (isSelectionValid()) {
            document.cut()
        }
    }

    function copyText() {
        if (isSelectionValid()) {
            document.copy()
        }
    }

    function pasteText() {
        document.paste()
    }

    function deleteText() {
        if (isSelectionValid()) {
            let sel = getSelection()
            document.remove(sel[0], sel[1])
        }
    }


    function getSelection() {
        return ([
            document.cursorSelection.selectionStart,
            document.cursorSelection.selectionEnd
        ])
    }

    function isSelectionValid() {
        let sel = getSelection()
        return (sel[0] !== sel[1])
    }

    function updateEditItemValidity() {
        editMenu.updateItemValidity()
    }

    Component.onCompleted: {
        width = Screen.width * 0.75
        height = Screen.height * 0.75
        createNewFile()
        updateTitle(document.getFormalFileName())
        updateEditItemValidity()
    }

    onClosing: (close) => {
        console.log("Closing...")
        if (!document.isModified()) {
            close.accepted = true
            return

        }
        close.accepted = false
        document.handleChanges(function() {
            window.close()
        })
    }
}
