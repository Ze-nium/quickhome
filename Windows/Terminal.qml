import Quickshell
import QtQuick

import qs.Widgets

PanelWindow {
  focusable: true

  implicitWidth: 2048
  implicitHeight: 15
  anchors {
    bottom: true
  }

  color: "#00000000"
  
  TerminalWidget {
    anchors.centerIn: parent
  }
}
