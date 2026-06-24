import QtQuick
import QtQuick.Controls

Menu {
    property alias undoAction: undoAction
    property alias cutAction: cutAction
    property alias copyAction: copyAction
    property alias pasteAction: pasteAction
    property alias deleteAction: deleteAction
    property alias selectAllAction: selectAllAction

    title: qsTr("&Edit")

    MenuItem {
        action: Action {
            id: undoAction
            text: "Undo"
            shortcut: "Ctrl+Z"
            enabled: window.document.textArea.canUndo
            onTriggered: window.document.textArea.undo()
        }
    }

    MenuSeparator { }

    MenuItem {
        action: Action {
            id: cutAction
            text: "Cut"
            shortcut: "Ctrl+X"
            enabled: window.document.textArea.hasSelection
            onTriggered: window.document.textArea.cut()
        }
    }
    MenuItem {
        action: Action {
            id: copyAction
            text: "Copy"
            shortcut: "Ctrl+C"
            enabled: window.document.textArea.hasSelection
            onTriggered: window.document.textArea.copy()
        }
    }
    MenuItem {
        action: Action {
            id: pasteAction
            text: "Paste"
            shortcut: "Ctrl+V"
            onTriggered: window.document.textArea.paste()
        }
    }
    MenuItem {
        action: Action {
            id: deleteAction
            text: "Delete"
            shortcut: "Del"
            enabled: window.document.textArea.hasSelection
            onTriggered: window.document.textArea.remove(window.document.getSelection()[0], window.document.getSelection()[1])
        }
    }

    MenuSeparator { }

    MenuItem {
        action: Action {
            text: "Find..."
            shortcut: "Ctrl+F"
            enabled: window.document.textArea.length > 0
            onTriggered:  window.findWindow.show()
        }
    }

    MenuItem {
        action: Action {
            text: "Find Next..."
            shortcut: "F3"
            enabled: window.document.textArea.length > 0
            // onTriggered:  window.findWindow.show()
        }
    }

    MenuItem {
        action: Action {
            text: "Replace..."
            shortcut: "Ctrl+H"
            // onTriggered:  window.findWindow.show()
        }
    }

    MenuItem {
        action: Action {
            text: "Go To..."
            shortcut: "Ctrl+G"
            onTriggered:  window.gotoWindow.show()
        }
    }

    MenuSeparator { }

    MenuItem {
        action: Action {
            id: selectAllAction
            text: "Select All"
            shortcut: "Ctrl+A"
            onTriggered:  window.document.textArea.selectAll()
        }
    }
    MenuItem {
        action: Action {
            text: "Time/Date"
            shortcut: "F5"
            onTriggered: {
                let str = window.getCurrentTime() + " " + window.getCurrentDate()
                window.document.textArea.insert(window.document.textArea.cursorPosition, str)
            }
        }
    }
}
