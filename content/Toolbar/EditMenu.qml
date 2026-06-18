import QtQuick
import QtQuick.Controls

Menu {
    title: qsTr("&Edit")

    MenuItem {
        text: "Undo"
    }

    MenuSeparator { }

    MenuItem {
        text: "Cut"
    }
    MenuItem {
        text: "Copy"
    }
    MenuItem {
        text: "Paste"
    }
    MenuItem {
        text: "Delete"
    }

    MenuSeparator { }

    MenuItem {
        text: "Find..."
    }
    MenuItem {
        text: "Find Next..."
    }
    MenuItem {
        text: "Replace..."
    }
    MenuItem {
        text: "Go To..."
    }

    MenuSeparator { }

    MenuItem {
        text: "Select All"
    }
    MenuItem {
        text: "Time/Date"
    }
}
