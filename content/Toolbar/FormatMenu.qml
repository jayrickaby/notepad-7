import QtQuick
import QtQuick.Controls

Menu {
    title: qsTr("F&ormat")
    y: parent.height

    MenuItem {
        text: "Word Wrap"
    }
    MenuItem {
        text: "Font..."
    }
}
