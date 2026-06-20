import QtQuick
import QtQuick.Controls

Menu {
    title: qsTr("&Edit")

    MenuItem {
        text: "Undo"
        enabled: window.document.canUndo

        onTriggered: {
            window.undoText()
        }
    }

    MenuSeparator { }

    MenuItem {
        text: "Cut"
        enabled: window.document.hasSelection

        onTriggered: {
            window.document.cut()
        }
    }
    MenuItem {
        text: "Copy"
        enabled: window.document.hasSelection

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
        text: "Delete"
        enabled: window.document.hasSelection

        onTriggered: {
            window.document.remove(window.document.getSelection()[0], window.document.getSelection()[1])
        }
    }

    MenuSeparator { }

    MenuItem {
        text: "Find..."

        onTriggered: {
            window.findWindow.show()
        }
    }
    MenuItem { text: "Find Next..." }
    MenuItem { text: "Replace..." }
    MenuItem {
    text: "Go To..."
            onTriggered: {
                window.gotoWindow.lineNumber = window.document.currentLine
                window.gotoWindow.show()
        }
    }

    MenuSeparator { }

    MenuItem { text: "Select All" }
    MenuItem { text: "Time/Date" }

}
