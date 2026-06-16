from PySide6.QtCore import QObject, Signal, Slot, QFile, QFileInfo, QIODevice, QTextStream, QUrl

class NotepadToolbar(QObject):
    # requestOpenFile = Signal(text)

    def __init__(self, parent=None):
        super().__init__(parent)

    @Slot(QUrl, result=dict)
    def getFileData(self, url):
        localPath = url.toLocalFile()
        file = QFile(localPath)
        fileInfo = QFileInfo(file)

        if not file.open(QIODevice.ReadOnly | QIODevice.Text):
            print(f"Failed to open file: {localPath}")
            return {}

        textStream = QTextStream(file)
        content = textStream.readAll()

        file.close()

        return {
            "name": fileInfo.fileName(),
            "path": fileInfo.absoluteFilePath(),
            "data": content
        }

    @Slot(str,  QUrl)
    def saveFileData(self, data, url):
        localPath = url.toLocalFile()
        file = QFile(localPath)

        if file.open(QIODevice.OpenModeFlag.WriteOnly | QIODevice.OpenModeFlag.Text):
            textStream = QTextStream(file)
            textStream << data
            file.close()
            print("Wrote to: " + localPath)
        else:
            print("Failed to open path: " + file.errorString())
