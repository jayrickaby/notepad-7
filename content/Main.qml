import QtQuick
import QtQuick.Controls
import QtQuick.Window

ApplicationWindow {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Notepad")

    Component.onCompleted: {
        width = Screen.width * 0.75
        height = Screen.height * 0.75
    }
}
