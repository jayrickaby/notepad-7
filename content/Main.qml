import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

import "Toolbar"

ApplicationWindow {
    id: window

    readonly property url baseUrl: Qt.resolvedUrl("../")
    readonly property url assetsUrl: Qt.resolvedUrl("../assets/")
    readonly property url documentsFolder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)

    property url currentUrl: ""
    property string appTitle: "Notepad–7"

    width: 640
    height: 480
    visible: true

    header: NotepadToolbar {

    }

    TextEdit {
        id: document
        anchors.fill: parent
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

    function updateTitle(fileName) {
        var result = ""
        if (fileName === "" || fileName === undefined) {
            fileName = ("Untitled");
        }

        result = (fileName + " - " + appTitle)
        console.log("Updating Title: \"" + result + "\"");
        title = qsTr(result)
    }

    function createNewFile() {
        setCurrentUrl("")
        setDocumentText("")
        updateTitle("")
    }

    function loadFile(file) {
        setCurrentUrl(Qt.resolvedUrl(file.path))
        setDocumentText(file.data)
        updateTitle(file.name)
    }

    Component.onCompleted: {
        width = Screen.width * 0.75
        height = Screen.height * 0.75

        updateTitle("")
    }
}
