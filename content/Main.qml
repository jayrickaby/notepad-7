import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Layouts
import QtQuick.Window

import "Toolbar"

ApplicationWindow {
    id: window

    readonly property url baseUrl: Qt.resolvedUrl("../")
    readonly property url assetsUrl: Qt.resolvedUrl("../assets/")
    readonly property url documentsFolder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)

    property string currentFile: ""
    property url currentUrl: documentsFolder
    property string appTitle: "Notepad–7"

    property bool modified: false

    width: 640
    height: 480
    visible: true

    header: NotepadToolbar {

    }

    TextEdit {
        id: document
        anchors.fill: parent

        onTextEdited: {
            modified = true
        }
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

    function getDocumentText() {
        return document.text
    }

    function setDocumentText(data) {
        document.text = data
    }

    function getCurrentFileName() {
        // Because of JS shenanigans, if currentFile is undefined or "", it is falsey
        return currentFile || "Untitled"
    }

    function updateTitle() {
        var fileName = getCurrentFileName()
        var result = ""

        result = (fileName + " - " + appTitle)
        console.log("Updating Title: \"" + result + "\"");
        title = qsTr(result)
    }

    function createNewFile() {
        //setCurrentUrl("")
        detectChanges()
        setDocumentText("")
        updateTitle("")
    }

    function loadFile(file) {
        detectChanges()
        setCurrentUrl(Qt.resolvedUrl(file.path))
        setDocumentText(file.data)
        updateTitle(file.name)
    }

    function saveFile() {
        var data = getDocumentText()
        var path = getCurrentUrl()
        toolbarBackend.saveFileData(data, path)
        modified = false
    }

    function detectChanges() {
        if (!modified) {
            return
        }

        var fileName = getCurrentFileName()

        saveChangesMessage.text = "Do you want to save changes to " + fileName + "?"
        saveChangesMessage.open()
    }



    Component.onCompleted: {
        width = Screen.width * 0.75
        height = Screen.height * 0.75


       createNewFile()
    }
}
