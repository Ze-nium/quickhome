import Quickshell
import QtQuick

import qs.Widgets

PanelWindow {
  exclusionMode: ExclusionMode.Normal
  exclusiveZone: 40

  anchors {
    top: true
    // left: true
    // right: true
  }

  implicitHeight: 30 + clockWidget.anchors.topMargin * 2
  implicitWidth: clockWidget.contentWidth + 350

  // Panel itself should be invisible, the rectangle is drawn over
  color: "#00000000"

  Rectangle {
    anchors.centerIn: parent
    anchors.fill: parent

    bottomLeftRadius: 10
    bottomRightRadius: 10
    
    color: "#ff1B1B1B"

    ClockWidget {
      id: clockWidget
      anchors {
        centerIn: parent
        topMargin: 10
        bottomMargin: this.topMargin 
      }
      fontSize: 28 
    }

    MouseArea {
      anchors {
        fill: parent
      }
      onClicked: {
        console.log("Opening bar!")
        rsWidgetRect.state = "hidden"
      }

    }
  }

}
