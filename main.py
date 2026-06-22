# This Python file uses the following encoding: utf-8
import sys
from pathlib import Path

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtGui import QIcon
from PySide6.QtQuickControls2 import QQuickStyle
from PySide6.QtCore import QSysInfo

def getOsName():
    type = QSysInfo.productType()
    name = QSysInfo.prettyProductName()

    # Format Windows to look exactly like it is in Winver
    if type == "windows":
        name = "Microsoft Windows"

    return name

def getOsVersion():
    return QSysInfo.productVersion()

def getOsBuild():
    return QSysInfo.kernelVersion()

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    QQuickStyle.setStyle("Aero7")
    QQuickStyle.setFallbackStyle("Fusion")

    engine = QQmlApplicationEngine()
    engine.addImportPath("content/")

    app.setWindowIcon(QIcon("content/Aero7/assets/windows/icon/icon.ico"))

    osName = getOsName()
    engine.rootContext().setContextProperty("osName", osName)

    osVersion = getOsVersion()
    engine.rootContext().setContextProperty("osVersion", osVersion)

    osBuild = getOsBuild()
    engine.rootContext().setContextProperty("osBuild", osBuild)

    engine.addImportPath(Path(__file__).parent)
    engine.loadFromModule("content", "Main")
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())


