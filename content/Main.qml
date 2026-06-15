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
        }
    }

    Component.onCompleted: {
        width = Screen.width * 0.75
        height = Screen.height * 0.75
    }
}
