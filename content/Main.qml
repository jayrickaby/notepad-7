import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Layouts
import QtQuick.Window

import "Document"
import "Toolbar"

ApplicationWindow {
    id: window

    readonly property url baseUrl: Qt.resolvedUrl("../")
    readonly property url assetsUrl: Qt.resolvedUrl("../assets/")
    readonly property url documentsFolder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)

    property string currentFile: ""
    property string appTitle: "Notepad–7"


    width: 640
    height: 480
    visible: true

    header: NotepadToolbar {

    }

    NotepadDocument {
        id: document
        anchors.fill: parent
    }

    MessageDialog {
        id: saveChangesMessage
        title: appTitle
        buttons: MessageDialog.Save | MessageDialog.Discard | MessageDialog.Cancel
    }

    function getCurrentUrl() {
        return document.getSource() || documentsFolder
    }

    function setCurrentUrl(newUrl) {
        documents.setSource(documentsFolder)
    }

    function getCurrentFileName() {
        // Because of JS shenanigans, if currentFile is undefined or "", it is falsey
        return currentFile || "Untitled"
    }

    function setCurrentFileName(name) {
        currentFile = name
    }

    function updateTitle() {
        let fileName = getCurrentFileName()
        let result = ""

        result = (fileName + " - " + appTitle)
        console.log("Updated Title: \"" + result + "\"");
        title = qsTr(result)
    }

    function createNewFile() {
        console.log("Creating new file...")
        detectChanges()
        document.clear()
        document.setSource("")
        setCurrentFileName("")
        updateTitle()
        console.log("New file created.")
    }

    function loadFile(file) {
        console.log("Loading file: \"" + file.name + "\"...")
        detectChanges()
        document.setSource(Qt.resolvedUrl(file.path))
        setCurrentFileName(file.name)
        updateTitle()
        console.log("Loaded file: \"" + file.name + "\".")
    }

    function saveFile() {
        let data = document.getContents()
        let path = getCurrentUrl()
        console.log("Saving file to: \"" + path + "\"...")
        toolbarBackend.saveFileData(data, path)
        document.modified = false
        console.log("Saved file to: \"" + path + "\".")
    }

    function detectChanges() {
        console.log("Detecting Changes")
        if (!document.isModified()) {
            console.log("No changes detected.")
            return
        }

        console.log("Changes detected!")

        let fileName = getCurrentFileName()

        saveChangesMessage.text = "Do you want to save changes to " + fileName + "?"
        saveChangesMessage.open()
    }



    Component.onCompleted: {
        width = Screen.width * 0.75
        height = Screen.height * 0.75
        createNewFile()
    }
}
