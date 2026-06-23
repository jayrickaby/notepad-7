import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

ApplicationWindow {
    id: aboutWindow
    title: qsTr("About " + window.appTitle)

    width: 458
    height: 374

    // Not resizeable
    maximumHeight: height
    maximumWidth: width

    minimumHeight: height
    minimumWidth: width

    // Force user focus
    modality: Qt.WindowModal

    leftPadding: 9
    rightPadding: 9
    topPadding: 10
    bottomPadding: 10

    ColumnLayout {
        anchors.fill: parent

        // FIXME: Is currently overstretched and stuff.
        Image {
        id: img
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 125
            Layout.preferredHeight: 25
            fillMode: Image.PreserveAspectFit
            source: Qt.resolvedUrl("../../Aero7/assets/logo/logo_cropped.png")
        }

        Text {
            id: osNameText
            text: osName
        }

        Text {
            id: osVersionText
            text: "Version " + osVersion + " (Build " + osBuild + ")"
        }

        Text {
            id: copyrightText
            text: "Open Source ! 2026 Jay Rickaby. All burgers preordered."
        }

         Text {
             id: aeroDescText
             text: "Microsoft® Windows™ is a registered trademark of Microsoft® Corporation. This name is used for referential use only, and does not aim to usurp copyrights from Microsoft. Microsoft Ⓒ 2026 All rights reserved. All resources belong to Microsoft Corporation."
         }


        Button {
            Layout.alignment: Qt.AlignRight | Qt.AlignBottom
            text: "OK"
            highlighted: true

            onClicked: {
                aboutWindow.close()
            }
        }
    }
}
