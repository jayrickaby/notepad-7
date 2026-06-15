import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ToolBar {
    id: notepadToolbar
    RowLayout {
        id: toolBarLayout

        Button {
            id: fileButton
            text: "File"
            onClicked: fileMenu.open()

            FileMenu {
                id: fileMenu
            }
        }

        Button {
            id: editButton
            text: "Edit"
            onClicked: editMenu.open()

            EditMenu {
                id: editMenu
            }
        }

        Button {
            id: formatButton
            text: "Format"
            onClicked: formatMenu.open()

            FormatMenu {
                id: formatMenu
            }
        }

        Button {
            id: viewButton
            text: "View"
            onClicked: viewMenu.open()

            ViewMenu {
                id: viewMenu
            }
        }

        Button {
            id: helpButton
            text: "Help"
            onClicked: helpMenu.open()

            HelpMenu {
                id: helpMenu
            }
        }
    }
}