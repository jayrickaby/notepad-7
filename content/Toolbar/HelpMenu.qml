import QtQuick
import QtQuick.Controls

Menu {
    id: helpMenu
    y: parent.height

    MenuItem {
        text: "View Help"
    }

    MenuSeparator { }

    MenuItem {
        text: "About Notepad"
    }

}
