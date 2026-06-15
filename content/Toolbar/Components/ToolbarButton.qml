import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Button {
    Layout.preferredHeight: parent.height

    // Explicitly set 9 or else it is slightly too big
    font.pointSize: 9

    font.hintingPreference: Font.PreferFullHinting

    // Override so its similar to windows font rendering
    contentItem: Text {
        text: parent.text
        font: parent.font

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        //elide: Text.ElideRight

        renderType: Text.NativeRendering
    }
}
