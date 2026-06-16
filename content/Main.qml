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
    property url currentUrl: documentsFolder

    width: 640
    height: 480
    visible: true
    title: qsTr("Notepad")

    header: NotepadToolbar {

    }

    TextEdit {
        id: documentElement
        anchors.fill: parent
    }

    Component.onCompleted: {
        width = Screen.width * 0.75
        height = Screen.height * 0.75
    }
}
