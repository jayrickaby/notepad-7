import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "Components"

ToolBar {
    id: notepadToolbar

    height: 19

    RowLayout {
        id: toolBarLayout

        anchors.fill: parent

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