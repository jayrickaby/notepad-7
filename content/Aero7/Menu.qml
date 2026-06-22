
import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl
import QtQuick.Controls.Fusion
import QtQuick.Controls.Fusion.impl
import QtQuick.Window

T.Menu {
    id: control
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    margins: 0
    horizontalPadding: 3
    verticalPadding: 3

    delegate: MenuItem { }

    contentItem: Column {
        id: column
        Repeater {
            model: control.contentModel
        }

    }

    background: Rectangle {
        BorderImage {
            anchors.fill: parent

            border.left: 1
            border.right: 1
            border.top: 1
            border.bottom: 1

            horizontalTileMode: BorderImage.Repeat
            verticalTileMode: BorderImage.Repeat

            source: Qt.resolvedUrl("assets/windows/menu/menu_background.png")
        }
    }

    onOpened: {
        x = -1
    }
}