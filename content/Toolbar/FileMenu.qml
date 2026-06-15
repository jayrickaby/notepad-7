import QtQuick
import QtQuick.Controls

Menu {
    y: parent.height

    MenuItem {
        text: "New"
    }
    MenuItem {
        text: "Open..."
    }
    MenuItem {
        text: "Save"
    }
    MenuItem {
        text: "Save As..."
    }

    MenuSeparator { }

    MenuItem {
        text: "Page Setup..."
    }
    MenuItem {
        text: "Print..."
    }

    MenuSeparator { }

    MenuItem {
        text: "Exit"
    }
}
