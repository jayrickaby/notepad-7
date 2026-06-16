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

    width: 640
    height: 480
    visible: true
    title: qsTr("Notepad")

    header: NotepadToolbar {

    }

    FileDialog {
        id: openFileDialog
    }

    TextEdit {
        anchors.fill: parent
    }

    Connections {
        target: toolbarBackend
        function onRequestOpenFile() {
            openFileDialog.open()
        }
    }

    Component.onCompleted: {
        width = Screen.width * 0.75
        height = Screen.height * 0.75
    }
}
