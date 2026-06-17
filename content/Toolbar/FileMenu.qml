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
            openFileDialog.open()
        }
    }
    MenuItem {
        text: "Save"

        onTriggered: {
            window.saveFile()
        }
    }
    MenuItem {
        text: "Save As..."
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
    }

    FileDialog {
        id: openFileDialog
        title: "Open"
        currentFolder: window.currentUrl
        nameFilters: ["Text Documents (*.txt)", "All Files"]
        onAccepted: {
            let fileData = (toolbarBackend.getFileData(selectedFile))

            if (fileData.name !== undefined) {
                window.loadFile(fileData)
            }
        }
    }
}
