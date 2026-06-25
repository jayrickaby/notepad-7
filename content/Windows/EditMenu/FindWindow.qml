import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

// TODO: ApplicationWindow
// TODO: Make pretty
// TODO: Add functionality
Window {
    width: 370
    height: 139
    title: qsTr("Find")

    RowLayout {
        ColumnLayout{
            RowLayout {
                Text { text: "Find what:" }
                TextField {
                    Layout.fillWidth: true
                }
            }

            RowLayout {
                CheckBox { text: "Match case" }
                GroupBox {
                    title: "Direction"
                    RowLayout {
                        CheckBox { text: "Up" }
                        CheckBox { text: "Down" }
                    }
                }
            }
        }

        ColumnLayout {
            Button { text: "Find Next" }
            Button { text: "Cancel" }
        }
    }
}
