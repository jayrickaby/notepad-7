// Copyright (C) 2017 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
// Qt-Security score:significant reason:default

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl
import QtQuick.Controls.Fusion
import QtQuick.Controls.Fusion.impl
import QtQuick.Layouts

T.MenuItem {
    readonly property url backgroundHot: Qt.resolvedUrl("assets/windows/menu/menuitem_hot.png")
    readonly property url backgroundPushed: Qt.resolvedUrl("assets/windows/menu/menuitem_pushed.png")
    readonly property url imgGutter: Qt.resolvedUrl("assets/windows/menu/menu_gutter.png")


    property string shortcut: ""

    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

    padding: 0



    //Explicitly set 9 or else it is slightly too big
    font.pointSize: 9
    font.letterSpacing: 0.10
    font.hintingPreference: Font.PreferFullHinting


    contentItem: RowLayout {
//        leftPadding: 22 + 3 + 3 + 4  // checkmark + empty space + gutter + empty space
//        rightPadding: 19

        spacing: 64
        anchors.fill: parent

        Text {
            text: control.text
            font: control.font
            Layout.preferredHeight: 22
            Layout.leftMargin: 22 + 3 + 3 + 4
            Layout.alignment : Qt.AlignVCenter
            Layout.topMargin: 2
            Layout.bottomMargin: -2
            renderType: Text.NativeRendering
            color: enabled ? "#000000" : "#6D6D6D"
        }

        Text {
            text: control.shortcut
            font: control.font
            Layout.preferredHeight: 22
            Layout.alignment : Qt.AlignVCenter | Qt. AlignRight
            Layout.rightMargin: 18
            horizontalAlignment: Text.AlignRight
            Layout.topMargin: 2
            Layout.bottomMargin: -2

            renderType: Text.NativeRendering
            color: enabled ? "#000000" : "#6D6D6D"
        }
    }

    indicator: Item {
        id: checkmark

        visible: control.checkable && control.checked
        anchors.left: parent.left
        width: 22
        height: 22

        BorderImage {
            anchors.fill: parent

            border.left: 3
            border.right: 3
            border.top: 3
            border.bottom: 3


            horizontalTileMode: BorderImage.Repeat
            verticalTileMode: BorderImage.Repeat

            source: Qt.resolvedUrl("assets/windows/menu/checkmark_background.png")
        }

        // Above background
        Image {
            width: 11
            height: 11
            anchors.centerIn: parent

            source: Qt.resolvedUrl("assets/windows/menu/checkmark.png")
        }
    }
    background: Rectangle {

        anchors.fill: parent

        color: "#f1f1f1"

        Image {
            id: gutter
            width: 3
            height: parent.height
            anchors.left: parent.left
            anchors.leftMargin: 22 + 3 // checkbox + whitespace
            source: control.imgGutter
        }

        BorderImage {
            anchors.fill: parent

            border.left: 3
            border.right: 3
            border.top: 3
            border.bottom: 3

            horizontalTileMode: BorderImage.Repeat
            verticalTileMode: BorderImage.Stretch

            // Swap the image asset depending on whether the button is hovered or pressed
            source: {
                if (control.pressed) {
                    return backgroundPushed
                }
                if (control.highlighted) {
                    return backgroundHot
                }
                return ""
            }
        }
    }
}
