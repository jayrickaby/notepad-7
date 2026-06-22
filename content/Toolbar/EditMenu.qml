import QtQuick
import QtQuick.Controls

Menu {
    title: qsTr("&Edit")

    MenuItem {
        text: "Undo"
        enabled: window.document.textArea.canUndo

        onTriggered: {
            window.document.textArea.undo()
        }
    }

    MenuSeparator { }

    MenuItem {
        text: "Cut"
        enabled: window.document.textArea.hasSelection

        onTriggered: {
            window.document.textArea.cut()
        }
    }
    MenuItem {
        text: "Copy"
        enabled: window.document.textArea.hasSelection

        onTriggered: {
            window.document.textArea.copy()
        }
    }
    MenuItem {
        text: "Paste"

        onTriggered: {
            window.document.textArea.paste()
        }
    }
    MenuItem {
        text: "Delete"
        enabled: window.document.textArea.hasSelection

        onTriggered: {
            window.document.textArea.remove(window.document.getSelection()[0], window.document.getSelection()[1])
        }
    }

    MenuSeparator { }

    MenuItem {
        text: "Find..."
        enabled: window.document.textArea.length > 0

        onTriggered: {
            window.findWindow.show()
        }
    }

    MenuItem {
        text: "Find Next..."
        enabled: window.document.textArea.length > 0
    }

    MenuItem {
        text: "Replace..."
    }

    MenuItem {
        text: "Go To..."
        onTriggered: {
            window.gotoWindow.show()
        }
    }

    MenuSeparator { }

    MenuItem {
        text: "Select All"
        onTriggered: {
            window.document.textArea.selectAll()
        }
    }
    MenuItem {
        text: "Time/Date"
        onTriggered: {
            let str = window.getCurrentTime() + " " + window.getCurrentDate()
            window.document.textArea.insert(window.document.textArea.cursorPosition, str)
        }
    }

}
