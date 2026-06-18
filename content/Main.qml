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

    function createNewFile() {
        document.invokeCreate()
    }

    function saveCurrentFile() {
        document.invokeSave()
    }



    Component.onCompleted: {
        width = Screen.width * 0.75
        height = Screen.height * 0.75
        createNewFile()
    }
}
