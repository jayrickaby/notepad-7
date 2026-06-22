import QtQuick
import QtQuick.Controls

Menu {
    title: qsTr("F&ormat")
    y: parent.height

    MenuItem {
        text: "Word Wrap"
        checkable: true

        onTriggered: {
            if (checked) {
                window.document.setWrapMode(TextEdit.Wrap)
                return
            }

            window.document.setWrapMode(TextEdit.NoWrap)
        }
    }
    MenuItem {
        text: "Font..."
    }
}
