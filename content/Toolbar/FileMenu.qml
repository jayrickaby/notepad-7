import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Menu {
    title: qsTr("&File")
    y: parent.height

    MenuItem {
        text: "New"
        shortcut: "Ctrl+N"

        onTriggered: {
            window.document.invokeCreate()
        }
    }
    MenuItem {
        text: "Open..."
        shortcut: "Ctrl+O"

        onTriggered: {
            window.document.invokeLoad()
        }
    }
    MenuItem {
        text: "Save"
        shortcut: "Ctrl+S"

        onTriggered: {
            window.document.invokeSave()
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
        text: "Print..."
        shortcut: "Ctrl+P"
    }

    MenuSeparator { }

    MenuItem {
        text: "Exit"

        onTriggered: {
            window.close()
        }
    }
}
