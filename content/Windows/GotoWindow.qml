import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

ApplicationWindow {
    property alias lineNumber: textField.text
    id: gotoWindow

    title: qsTr("Go To Line")

    width: 249
    height: 98

    // Not resizeable
    maximumHeight: height
    maximumWidth: width

    minimumHeight: height
    minimumWidth: width

    // Force user focus
    modality: Qt.WindowModal

    font.pointSize: 9

    leftPadding: 11
    rightPadding: 11
    topPadding: 13
    bottomPadding: 13

    // Rectangle {
    //     border.color: "red"
    //     anchors.fill: parent
    // }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Text {
            text: "Line number :"
            Layout.alignment: Qt.AlignTop
            Layout.topMargin: -4
            font.letterSpacing: -0.75
            renderType: Text.NativeRendering
        }
        TextField {
            id: textField
            text: "1"
            Layout.preferredHeight: 23
            Layout.alignment: Qt.AlignTop
            Layout.topMargin: 1
            Layout.fillWidth: true
            renderType: Text.NativeRendering
        }

        RowLayout {
            Layout.alignment: Qt.AlignRight | Qt.AlignBottom
            spacing: 8
            Button {
                text: "Go To"

                onClicked: {
                    if (window.document.goToLine(textField.text)){
                        gotoWindow.close()
                    }
                }
            }
            Button {
                text: "Cancel"
                onClicked: {
                    gotoWindow.close()
                }

            }
        }
    }


    onVisibleChanged: {
        textField.forceActiveFocus()
        textField.selectAll()
    }

}
