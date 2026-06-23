import QtQuick
import QtQuick.Controls

Menu {
    title: qsTr("&Edit")

    MenuItem {
        text: "Undo"
        shortcut: "Ctrl+Z"
        enabled: window.document.textArea.canUndo

        onTriggered: {
            window.document.textArea.undo()
        }
    }

    MenuSeparator { }

    MenuItem {
        text: "Cut"
        shortcut: "Ctrl+X"
        enabled: window.document.textArea.hasSelection

        onTriggered: {
            window.document.textArea.cut()
        }
    }
    MenuItem {
        text: "Copy"
        shortcut: "Ctrl+C"
        enabled: window.document.textArea.hasSelection

        onTriggered: {
            window.document.textArea.copy()
        }
    }
    MenuItem {
        text: "Paste"
        shortcut: "Ctrl+V"

        onTriggered: {
            window.document.textArea.paste()
        }
    }
    MenuItem {
        text: "Delete"
        shortcut: "Del"
        enabled: window.document.textArea.hasSelection

        onTriggered: {
            window.document.textArea.remove(window.document.getSelection()[0], window.document.getSelection()[1])
        }
    }

    MenuSeparator { }

    MenuItem {
        text: "Find..."
        shortcut: "Ctrl+F"
        enabled: window.document.textArea.length > 0

        onTriggered: {
            window.findWindow.show()
        }
    }

    MenuItem {
        text: "Find Next..."
        shortcut: "F3"
        enabled: window.document.textArea.length > 0
    }

    MenuItem {
        text: "Replace..."
        shortcut: "Ctrl+H"
    }

    MenuItem {
        text: "Go To..."
        shortcut: "Ctrl+G"
        onTriggered: {
            window.gotoWindow.show()
        }
    }

    MenuSeparator { }

    MenuItem {
        text: "Select All"
        shortcut: "Ctrl+A"
        onTriggered: {
            window.document.textArea.selectAll()
        }
    }
    MenuItem {
        text: "Time/Date"
        shortcut: "F5"
        onTriggered: {
            let str = window.getCurrentTime() + " " + window.getCurrentDate()
            window.document.textArea.insert(window.document.textArea.cursorPosition, str)
        }
    }

}
