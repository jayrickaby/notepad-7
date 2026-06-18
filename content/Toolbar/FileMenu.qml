import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Menu {
    y: parent.height

    MenuItem {
        text: "New"

        onTriggered: {
            window.createNewFile()
        }
    }
    MenuItem {
        text: "Open..."

        onTriggered: {
            window.loadFile()
        }
    }
    MenuItem {
        text: "Save"

        onTriggered: {
            window.saveCurrentFile()
        }
    }
    MenuItem {
        text: "Save As..."

        onTriggered: {
            window.saveCurrentFileAs()
        }
    }

    MenuSeparator { }

    MenuItem {
        text: "Page Setup..."
    }
    MenuItem {
        text: "Print..."
    }

    MenuSeparator { }

    MenuItem {
        text: "Exit"

        onTriggered: {
            window.close()
        }
    }
}
