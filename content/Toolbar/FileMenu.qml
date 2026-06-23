import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Menu {
    title: qsTr("&File")
    y: parent.height

    MenuItem {
        action: Action {
            text: "New"
            shortcut: "Ctrl+N"

            onTriggered: window.document.invokeCreate()
        }
    }
    MenuItem {
        action: Action {
            text: "Open"
            shortcut: "Ctrl+O"

            onTriggered: window.document.invokeLoad()
        }
    }
    MenuItem {
        action: Action {
            text: "Save"
            shortcut: "Ctrl+S"

            onTriggered: window.document.invokeSave()
        }
    }
    MenuItem {
        text: "Save As..."

        onTriggered: {
            window.document.invokeSaveAs()
        }
    }

    MenuSeparator { }

    MenuItem {
        text: "Page Setup..."
    }
    MenuItem {
        action: Action {
            text: "Print..."
            shortcut: "Ctrl+P"

            // onTriggered: window.document.invokeLoad()
        }
    }

    MenuSeparator { }

    MenuItem {
        text: "Exit"

        onTriggered: {
            window.close()
        }
    }
}
