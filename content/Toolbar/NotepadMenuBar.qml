import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "Components"

MenuBar {
    height: 19

    // This offsets buttons 1px down
    topPadding: 1
    bottomPadding: 0
    leftPadding: 0
    rightPadding: 0

    delegate: ToolbarButton {}

    background: BorderImage {
        border.left: 1
        border.right: 1
        border.top: 1
        border.bottom: 1

        anchors.fill : parent

        // This ensures that the menubar gradient is correctly aligned
        anchors.topMargin: -1

        source: window.assetsUrl + "windows/menu/menubar.png"
    }

    spacing: 2

    FileMenu {}
    EditMenu {}
    FormatMenu {}
    HelpMenu {}
    ViewMenu {}

}