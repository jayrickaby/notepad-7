import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

Window {
    width: 370
    height: 139
    title: qsTr("Find")

    RowLayout {
        ColumnLayout{
            RowLayout {
                Text { text: "Find what:" }
                TextField {}
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
