import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Menu {
    y: parent.height

    MenuItem {
        text: "New"

        onTriggered: {
            createNewFile()``
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
        currentFolder: window.currentUrl
        nameFilters: ["Text Documents (*.txt)", "All Files"]
        onAccepted: {
            let fileData = (toolbarBackend.getFileData(selectedFile))

            if (fileData.name !== undefined) {
                window.setCurrentUrl(fileData.name)
                window.setDocumentText(fileData.data)
            }
        }
    }

    function createNewFile() {
        window.setCurrentUrl("")
        window.setDocumentText("")
    }
}
