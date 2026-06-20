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
            window.cutText()
        }
    }
    MenuItem {
        id: copyButton
        text: "Copy"

        onTriggered: {
            window.copyText()
        }
    }
    MenuItem {
        text: "Paste"

        onTriggered: {
            window.pasteText()
        }
    }
    MenuItem {
        id: deleteButton
        text: "Delete"

        onTriggered: {
            window.deleteText()
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
        if (!window.isSelectionValid()) {
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
