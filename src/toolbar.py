from PySide6.QtCore import QObject, Slot

class NotepadToolbar(QObject):
    def __init__(self, parent=None):
        super().__init__(parent)
        print("Toolbar loaded")

    @Slot()
    def openFile(self):
        print("openFile")