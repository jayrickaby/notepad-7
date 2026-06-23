// Copyright (C) 2017 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
// Qt-Security score:significant reason:default

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl
import QtQuick.Controls.Fusion
import QtQuick.Controls.Fusion.impl

T.MenuSeparator {
    id: control

    readonly property url imgGutter: Qt.resolvedUrl("assets/windows/menu/menu_gutter.png")
    readonly property url imgSeparator: Qt.resolvedUrl("assets/windows/menu/menu_separator.png")


    implicitWidth: 0
    implicitHeight:  Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    //leftPadding: 22 + 3 + 3 // checkbox + empty space + gutter
    rightPadding: 0

    contentItem: Row {
        anchors.fill: parent
        leftPadding: 25  // checkmark + empty space
        spacing:0

        Image {
            id: gutter

            width: 3
            height: 8
            source: control.imgGutter
        }

        Image {
            width: parent.width - gutter.width - parent.leftPadding
            height: 6
            anchors.verticalCenter: parent.verticalCenter
            source: imgSeparator
        }
    }

    background: Rectangle {
        anchors.fill: parent
        color: "#f1f1f1"
    }
}
