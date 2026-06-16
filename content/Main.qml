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

    property alias document: documentElement
    property url currentUrl: ""
    property string appTitle: "Notepad–7"


    width: 640
    height: 480
    visible: true

    header: NotepadToolbar {

    }

    TextEdit {
        id: documentElement
        anchors.fill: parent
    }

    function setCurrentUrl(newUrl) {
        currentUrl = newUrl
        updateTitle()
    }

    function updateTitle() {
        var result = ""
        var fileName = ""

        if (currentUrl == "") {
            fileName = ("Untitled");
        }
        else {
            fileName = (currentUrl);
        }

        result = (fileName + " - " + appTitle)
        console.log("Updating Title: \"" + result + "\"");
        title = qsTr(result)
    }

    Component.onCompleted: {
        width = Screen.width * 0.75
        height = Screen.height * 0.75

        updateTitle()
    }
}
