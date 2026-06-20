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

    property alias document: document
    property alias editMenu: editMenu

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

    Component.onCompleted: {
        width = Screen.width * 0.75
        height = Screen.height * 0.75
        document.invokeCreate()
        updateTitle(document.getFormalFileName())
        editMenu.updateItemValidity()
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
