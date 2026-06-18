import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.MenuBarItem {
    id: control
    readonly property url backgroundHot: Qt.resolvedUrl("assets/windows/menu/menuitem_hot.png")
    readonly property url backgroundPushed: Qt.resolvedUrl("assets/windows/menu/menuitem_pushed.png")

    implicitHeight: 18
    implicitWidth: contentItem.implicitWidth + (6 * 2)

    //font.letterSpacing: 0.05
    //Explicitly set 9 or else it is slightly too big
    font.pointSize: 9
    font.hintingPreference: Font.PreferFullHinting

    // Override so its similar to windows font rendering
    // TODO: Replace with custom.
    contentItem: IconLabel {
        text: control.text

        font: control.font

        //textFormat: Text.StyledText

        alignment: Text.AlignHCenter
        //verticalAlignment: Text.AlignVCenter

        // Text is 1 px above V center in Notepad
        topPadding: -1
        bottomPadding: 1

        //renderType: Text.NativeRendering
    }

    background: BorderImage {
        border.left: 3
        border.right: 3
        border.top: 3
        border.bottom: 3

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
