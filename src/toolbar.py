from PySide6.QtCore import QObject, Signal, Slot

class NotepadToolbar(QObject):
    requestOpenFile = Signal()

    def __init__(self, parent=None):
        super().__init__(parent)
        print("Toolbar loaded")

    @Slot()
    def openFile(self):
        self.requestOpenFile.emit()