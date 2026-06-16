import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Menu {
    y: parent.height

    MenuItem {
        text: "New"
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
                window.document.text = fileData.data
                window.setCurrentUrl(fileData.name)
            }


        }
    }
}
