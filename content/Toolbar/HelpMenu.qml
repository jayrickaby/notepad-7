import QtQuick
import QtQuick.Controls

Menu {
    title: qsTr("&Help")
    y: parent.height

    MenuItem {
        text: "View Help"
    }

    MenuSeparator { }

    MenuItem {
        text: "About " + window.appTitle
    }

}
