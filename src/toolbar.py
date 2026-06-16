from PySide6.QtCore import QObject, Signal, Slot, QFile, QIODevice, QUrl, QTextStream

class NotepadToolbar(QObject):
    # requestOpenFile = Signal(text)

    def __init__(self, parent=None):
        super().__init__(parent)
        print("Toolbar loaded")

    @Slot(QUrl, result=str)
    def openFile(self, url):
        localPath = url.toLocalFile()
        file = QFile(localPath)

        if not file.open(QIODevice.ReadOnly | QIODevice.Text):
            print(f"Failed to open file: {localPath}")
            return ""

        textStream = QTextStream(file)
        content = textStream.readAll()

        file.close()
        return content