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

    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    // implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
    //                          implicitContentHeight + topPadding + bottomPadding,
    //                          implicitIndicatorHeight + topPadding + bottomPadding)
    implicitHeight: 22

    padding: 0
    spacing: 0

    icon.width: 16
    icon.height: 16

    contentItem: Item {
        width: control.availableWidth
        height: control.availableHeight

        Item {
            id: iconArea
            width: 22
            height: 22
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter

            Image {
                anchors.centerIn: parent
                source: control.icon.source
                width: control.icon.width
                height: control.icon.height
                visible: control.icon.source.toString() !== ""
            }

            Text {
                id: labelText
                text: control.text
                font: control.font
                color: control.down || control.highlighted ? Fusion.highlightedText(control.palette) : control.palette.text

                anchors.left: iconArea.right
                anchors.leftMargin: 10 // 4px space + 2px line + 4px space
                anchors.verticalCenter: parent.verticalCenter
                elide: Text.ElideRight
            }
        }
    }

    arrow: ColorImage {
        x: control.mirrored ? control.padding : control.width - width - control.padding
        y: control.topPadding + (control.availableHeight - height) / 2
        width: 20

        visible: control.subMenu
        rotation: control.mirrored ? 90 : -90
        color: control.down || control.hovered || control.highlighted ? Fusion.highlightedText(control.palette) : control.palette.text
        source: "qrc:/qt-project.org/imports/QtQuick/Controls/Fusion/images/arrow.png"
        fillMode: Image.Pad
    }

    indicator: CheckIndicator {
        x: control.mirrored ? control.width - width - control.rightPadding : control.leftPadding
        y: control.topPadding + (control.availableHeight - height) / 2

        control: control
        visible: control.checkable
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 20

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
