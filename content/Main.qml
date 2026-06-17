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
    property url currentUrl: documentsFolder
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
        return currentUrl
    }

    function setCurrentUrl(newUrl) {
        currentUrl = newUrl
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
        console.log("Updating Title: \"" + result + "\"");
        title = qsTr(result)
    }

    function createNewFile() {
        //setCurrentUrl("")
        detectChanges()
        document.clearContents()
        setCurrentFileName("")
        updateTitle()
    }

    function loadFile(file) {
        detectChanges()
        setCurrentUrl(Qt.resolvedUrl(file.path))
        document.setContents(file.data)
        setCurrentFileName(file.name)
        updateTitle()
    }

    function saveFile() {
        let data = document.getContents()
        let path = getCurrentUrl()
        toolbarBackend.saveFileData(data, path)
        document.isModified = false
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
