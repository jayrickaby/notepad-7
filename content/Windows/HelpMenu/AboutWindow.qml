import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

ApplicationWindow {
    title: qsTr("About " + window.appTitle)

    width: 458
    height: 374

    // Not resizeable
    maximumHeight: height
    maximumWidth: width

    minimumHeight: height
    minimumWidth: width

    // Force user focus
    modality: Qt.WindowModal

    ColumnLayout {

        Button {
            text: "OK"
            highlighted: true
        }
    }
}
