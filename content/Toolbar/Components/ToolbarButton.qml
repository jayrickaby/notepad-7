import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Button {
    readonly property url backgroundHot: window.assetsUrl + "windows/menu/menuitem_hot.png"
    readonly property url backgroundPushed: window.assetsUrl + "windows/menu/menuitem_pushed.png"

    Layout.preferredHeight: 18
    Layout.preferredWidth: contentItem.implicitWidth + (6 * 2)
    Layout.alignment: Qt.AlignBottom


    //font.letterSpacing: 0.05
    // Explicitly set 9 or else it is slightly too big
    font.pointSize: 9

    font.hintingPreference: Font.PreferFullHinting

    // Override so its similar to windows font rendering
    contentItem: Text {
        text: parent.text
        font: parent.font

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        // Text is 1 px above V center in Notepad
        topPadding: -1
        bottomPadding: 1


        renderType: Text.NativeRendering
    }

    background: BorderImage {
        border.left: 3
        border.right: 3
        border.top: 3
        border.bottom: 3

        // Swap the image asset depending on whether the button is hovered or pressed
        source: {
            if (pressed) {
                return backgroundPushed
            }
            if (hovered) {
                return backgroundHot
            }
            return ""
        }
    }
}
