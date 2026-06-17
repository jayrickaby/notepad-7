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

    function getSource() {
        return textDocument.source
    }

    function clearSource() {
        textDocument.source = ""
    }

    function setSource(url) {
        textDocument.source = Qt.resolvedUrl(url)
    }

    function isModified() {
        return modified
    }
}
