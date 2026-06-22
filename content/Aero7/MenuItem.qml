// Copyright (C) 2017 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
// Qt-Security score:significant reason:default

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl
import QtQuick.Controls.Fusion
import QtQuick.Controls.Fusion.impl

T.MenuItem {
    readonly property url backgroundHot: Qt.resolvedUrl("assets/windows/menu/menuitem_hot.png")
    readonly property url backgroundPushed: Qt.resolvedUrl("assets/windows/menu/menuitem_pushed.png")
    readonly property url imgGutter: Qt.resolvedUrl("assets/windows/menu/menu_gutter.png")

    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    // implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
    //                          implicitContentHeight + topPadding + bottomPadding,
    //                          implicitIndicatorHeight + topPadding + bottomPadding)
    implicitHeight: 22

    padding: 0
    spacing: 0

    contentItem: Item {
        implicitWidth: gutter.width + gutter.anchors.leftMargin + label.implicitWidth + label.anchors.leftMargin
        implicitHeight: parent.height

        anchors.left: checkmark.right

        Image {
            id: gutter
            width: 3
            height: parent.height
            anchors.left: parent.left

            anchors.leftMargin: 3
            anchors.rightMargin: 3

            source: control.imgGutter
        }

        Text {
            id: label

            text: control.text
            font: control.font
            color: control.down || control.highlighted ? Fusion.highlightedText(control.palette) : control.palette.text

            anchors.left: gutter.right
            anchors.leftMargin: 4
            // anchors.rightMargin: 55
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -1
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

    onTriggered: {
        console.log("button w: " + width)
        console.log("button imp w: " + implicitWidth)
    }
}
