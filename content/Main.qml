import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

ApplicationWindow {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Notepad")

    header: ToolBar {
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

    Component.onCompleted: {
        width = Screen.width * 0.75
        height = Screen.height * 0.75
    }
}
