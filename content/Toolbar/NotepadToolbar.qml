import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "Components"

ToolBar {
    id: notepadToolbar
    height: 19

    // This offsets buttons 1px down
    topPadding: 1
    bottomPadding: 0
    leftPadding: 0
    rightPadding: 0

    BorderImage {
        border.left: 1
        border.right: 1
        border.top: 1
        border.bottom: 1

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: parent.top

        // This ensures that the menubar gradient is correctly aligned
        anchors.topMargin: -1

        source: window.assetsUrl + "windows/menu/menubar.png"
    }

    RowLayout {
        id: toolBarLayout

        spacing: 2

        Layout.fillHeight: parent.height
        Layout.fillWidth: parent.width

        anchors.left: parent.left

        anchors.leftMargin: 1

        ToolbarButton {
            id: fileButton
            text: "File"
            onClicked: fileMenu.open()

            FileMenu {
                id: fileMenu
            }
        }

        ToolbarButton {
            id: editButton
            text: "Edit"
            onClicked: editMenu.open()

            EditMenu {
                id: editMenu
            }
        }

        ToolbarButton {
            id: formatButton
            text: "Format"
            onClicked: formatMenu.open()

            FormatMenu {
                id: formatMenu
            }
        }

        ToolbarButton {
            id: viewButton
            text: "View"
            onClicked: viewMenu.open()

            ViewMenu {
                id: viewMenu
            }
        }

        ToolbarButton {
            id: helpButton
            text: "Help"
            onClicked: helpMenu.open()

            HelpMenu {
                id: helpMenu
            }
        }
    }
}