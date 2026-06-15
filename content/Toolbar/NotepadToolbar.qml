import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "Components"

ToolBar {
    id: notepadToolbar
    height: 19

    leftPadding: 0
    rightPadding: 0

    BorderImage {
        border.left: 1
        border.right: 1
        border.top: 1
        border.bottom: 1

        anchors.fill: parent
        source: window.assetsUrl + "windows/menu/menubar_background.png"
    }

    RowLayout {
        id: toolBarLayout

        spacing: 2

        Layout.fillHeight: parent.height
        Layout.fillWidth: parent.width

        anchors.left: parent.left

        anchors.leftMargin: 6

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