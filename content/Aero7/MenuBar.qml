import QtQuick
import QtQuick.Templates as T

T.MenuBar {
    height: 19

    // This offsets buttons 1px down
    topPadding: 1
    bottomPadding: 0
    leftPadding: 0
    rightPadding: 0

    background: BorderImage {
        border.left: 1
        border.right: 1
        border.top: 1
        border.bottom: 1

        anchors.fill : parent

        // This ensures that the menubar gradient is correctly aligned
        anchors.topMargin: -1

        source: Qt.resolvedUrl("assets/windows/menu/menubar.png")
    }

    spacing: 2
}