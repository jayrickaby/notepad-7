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

    function setSource(url) {
        // FIXME: This is a horrible way to mitigate the currently possibly broken detectChanges() and resetting source. But, it works.
        textDocument.modified = false
        textDocument.source = url
        console.log(textDocument.source)
    }

    function isModified() {
        return modified
    }
}
