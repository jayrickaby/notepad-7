import QtQuick
import QtQuick.Controls

Menu {
    title: qsTr("&Edit")

    MenuItem {
        id: undoButton
        text: "Undo"

        onTriggered: {
            window.undoText()
        }
    }

    MenuSeparator { }

    MenuItem {
        id: cutButton
        text: "Cut"

        onTriggered: {
            window.document.cut()
        }
    }
    MenuItem {
        id: copyButton
        text: "Copy"

        onTriggered: {
            window.document.copy()
        }
    }
    MenuItem {
        text: "Paste"

        onTriggered: {
            window.document.paste()
        }
    }
    MenuItem {
        id: deleteButton
        text: "Delete"

        onTriggered: {
            window.document.remove(window.document.getSelection()[0], window.document.getSelection()[1])
        }
    }

    MenuSeparator { }

    MenuItem {
        text: "Find..."
    }
    MenuItem {
        text: "Find Next..."
    }
    MenuItem {
        text: "Replace..."
    }
    MenuItem {
        text: "Go To..."
    }

    MenuSeparator { }

    MenuItem {
        text: "Select All"
    }
    MenuItem {
        text: "Time/Date"
    }

    function updateItemValidity(){
        if (!window.document.isSelectionValid()) {
            undoButton.enabled = false
            cutButton.enabled = false
            copyButton.enabled = false
            deleteButton.enabled = false
            return
        }

        undoButton.enabled = true
        cutButton.enabled = true
        copyButton.enabled = true
        deleteButton.enabled = true
    }
}
