import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

// TODO: ApplicationWindow
// TODO: Make pretty
// TODO: Add functionality
ApplicationWindow {
    width: 370
    height: 139
    title: qsTr("Find")

    // Not resizeable
    maximumHeight: height
    maximumWidth: width

    minimumHeight: height
    minimumWidth: width

    RowLayout {
        ColumnLayout{
            RowLayout {
                Text { text: "Find what:" }
                TextField {
                    id: inputField
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
            Button {
                text: "Find Next"

                onClicked: {
                    console.log(window.document.findNextWord(inputField.text))
                }
            }
            Button { text: "Cancel" }
        }
    }
}
