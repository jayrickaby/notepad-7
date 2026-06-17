import QtQuick


TextEdit {
    function invokeCreate() {
        console.log("Creating new file...")
        textDocument.modified = false
        clear()
        textDocument.source = ""
        console.log(textDocument.source)
        console.log("Created new file.")
    }
}