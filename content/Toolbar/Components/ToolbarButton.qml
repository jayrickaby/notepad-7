import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Button {
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
}
