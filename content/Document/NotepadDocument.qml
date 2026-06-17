import QtQuick


TextEdit {
    property bool modified: false

    onTextEdited: {
        modified = true
    }

    function clearContents() {
        setContents("")
    }

    function getContents() {
        return text
    }

    function setContents(data) {
        text = data
    }

    function isModified() {
        return modified
    }
}
