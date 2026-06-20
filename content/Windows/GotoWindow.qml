import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

Window {
    width: 249
    height: 98
    title: qsTr("Go To Line")

    ColumnLayout {
        Text { text: "Line number:" }
        TextField { text: "1" }

        RowLayout {
            Button { text: "Go To" }
            Button { text: "Cancel" }
        }
    }

}
