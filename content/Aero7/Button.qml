// Copyright (C) 2017 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
// Qt-Security score:significant reason:default

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl
import QtQuick.Controls.Fusion
import QtQuick.Controls.Fusion.impl

T.Button {
    id: control

    readonly property url assetsDir: Qt.resolvedUrl("assets/windows/button/")
    readonly property string img: "button.png"
    readonly property string imgHot: "button_hot.png"
    readonly property string imgPressed: "button_pressed.png"
    readonly property string imgDisabled: "button_disabled.png"
    readonly property string imgDefault: "button_default.png"
    readonly property string imgDefaultAnimated: "button_default_animated.png"


    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: 21

    topPadding: 3
    bottomPadding: 3
    leftPadding: 19
    rightPadding: 19

    contentItem: Text {
        text: control.text
        font.pointSize: 9
        color: !control.enabled ? "#838383" : "#000000"

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -1

        renderType: Text.NativeRendering
    }

    background: BorderImage {
        border.left: 3
        border.right: 3
        border.top: 3
        border.bottom: 3

        horizontalTileMode: BorderImage.Repeat
        verticalTileMode: BorderImage.Stretch

        // Swap the image asset depending on whether the button is hovered or pressed
        source: {
            if (control.pressed) {
                return assetsDir + imgPressed
            }
            if (control.hovered) {
                return assetsDir + imgHot
            }
            if (control.highlighted) {
                return assetsDir + imgDefault
            }
            return assetsDir + img
        }
    }
}
