import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

ApplicationWindow {
    title: qsTr("Go To Line")

    width: 249
    height: 98

    // Not resizeable
    maximumHeight: height
    maximumWidth: width

    minimumHeight: height
    minimumWidth: width

    leftPadding: 11
    rightPadding: 11
    topPadding: 13
    bottomPadding: 13

    Rectangle {
        border.color: "red"
        anchors.fill: parent
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Text {
            text: "Line number:"

        }
        TextField {
            text: "1"

            Layout.fillWidth: true
        }

        RowLayout {
            Layout.alignment: Qt.AlignRight | Qt.AlignBottom
            spacing: 8
            Button { text: "Go To" }
            Button { text: "Cancel" }
        }
    }



}
