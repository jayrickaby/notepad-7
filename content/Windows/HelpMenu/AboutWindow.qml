import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

ApplicationWindow {
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

        Image {
            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
            Layout.preferredHeight: implicitHeight
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

        // Text {
        //     id: aeroDescText
        //     text: "LEGAL DISCLAIMER & TRADEMARK NOTICE\nI (Jay Rickaby) am an independent developer and is not affiliated, associated, authorised, endorsed by, or in any way officially connected with Microsoft Corporation or any of its subsidiaries or affiliates.\nThe official Microsoft website can be found at https://www.microsoft.com.\n\"Windows\", \"Windows 7\", \"Notepad\", and \"Aero\" are registered trademarks \n" +
        //         "of Microsoft Corporation.\nThis project, 'Notepad–7', and 'Aero 7', are open-source, from-scratch clones written in Qt Quick for educational and customisation purposes. It does not contain, use, or distribute proprietary Microsoft binary code. All simulated interface designs, layout references, and trademarks are the property of their respective owners and are used here under nominative fair use to describe the visual compatibility of this software."
        // }


        Button {
            Layout.alignment: Qt.AlignRight | Qt.AlignBottom
            text: "OK"
            highlighted: true
        }
    }
}
