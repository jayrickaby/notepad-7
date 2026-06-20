import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Menu {
    title: qsTr("&File")
    y: parent.height

    MenuItem {
        text: "New"

        onTriggered: {
            window.document.invokeCreate()
        }
    }
    MenuItem {
        text: "Open..."

        onTriggered: {
            window.document.invokeLoad()
        }
    }
    MenuItem {
        text: "Save"

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
    }

    MenuSeparator { }

    MenuItem {
        text: "Exit"

        onTriggered: {
            window.close()
        }
    }
}
