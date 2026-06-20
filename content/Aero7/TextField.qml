// Copyright (C) 2017 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
// Qt-Security score:significant reason:default

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl
import QtQuick.Controls.Fusion
import QtQuick.Controls.Fusion.impl

T.TextField {
    id: control

    readonly property url assetsDir: Qt.resolvedUrl("assets/windows/edit/")
    readonly property string imgBg: "edit_bg.png"
    readonly property string imgBgHot: "edit_bg_hot.png"
    readonly property string imgBgFocused: "edit_bg_focused.png"
    readonly property string imgBgDisabled: "button_disabled.png"

    implicitWidth: implicitBackgroundWidth + leftInset + rightInset
                   || Math.max(contentWidth, placeholder.implicitWidth) + leftPadding + rightPadding
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding,
                             placeholder.implicitHeight + topPadding + bottomPadding)

    padding: 4

    color: control.palette.text
    selectionColor: control.palette.highlight
    selectedTextColor: control.palette.highlightedText
    placeholderTextColor: control.palette.placeholderText
    verticalAlignment: TextInput.AlignVCenter

    ContextMenu.menu: TextEditingContextMenu {
        editor: control
    }

    PlaceholderText {
        id: placeholder
        x: control.leftPadding
        y: control.topPadding
        width: control.width - (control.leftPadding + control.rightPadding)
        height: control.height - (control.topPadding + control.bottomPadding)

        text: control.placeholderText
        font: control.font
        color: control.placeholderTextColor
        verticalAlignment: control.verticalAlignment
        visible: !control.length && !control.preeditText && (!control.activeFocus || control.horizontalAlignment !== Qt.AlignHCenter)
        elide: Text.ElideRight
        renderType: control.renderType
    }

    background: BorderImage {
        border.left: 2
        border.right: 2
        border.top: 2
        border.bottom: 2

        horizontalTileMode: BorderImage.Repeat
        verticalTileMode: BorderImage.Stretch

        source: {
            if (control.activeFocus) {
                return assetsDir + imgBgFocused
            }
            if (control.hovered) {
                return assetsDir + imgBgHot
            }
            return assetsDir + imgBg
        }
    }

}
