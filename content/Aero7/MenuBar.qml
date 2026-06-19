import QtQuick
import QtQuick.Templates as T

T.MenuBar {
    id: control

    // This offsets items 1px down
    topPadding: 1
    bottomPadding: 0
    leftPadding: 0
    rightPadding: 0

    // Taken from "src/quickcontrols/fusion/MenuBar.qml"
    delegate: MenuBarItem { }

    contentItem: Row {
        spacing: control.spacing
        Repeater {
            model: control.contentModel
        }
    }
    // End copy

    background: BorderImage {
        border.left: 1
        border.right: 1
        border.top: 1
        border.bottom: 1

        anchors.fill : parent

        // This ensures that the menubar gradient is correctly aligned
        anchors.topMargin: -1

        source: Qt.resolvedUrl("assets/windows/menu/menubar_background.png")
    }

    spacing: 2
}