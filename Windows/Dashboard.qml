import Quickshell
import QtQuick
import qs.Widgets

PanelWindow {
  visible: true
  
  implicitWidth: 100
  implicitHeight: 100

  color: "#00ffffff"


  Rectangle {
    id: rsWidgetRect
    state: "hidden"

    states: [
      State {
        name: "visible"
        PropertyChanges { target: rsWidgetRect; visible: true; }
      },
      State {
        name: "hidden"
        PropertyChanges { target: rsWidgetRect; visible: false; }
      }
    ]

    transitions: Transition {
      from: "hidden"
      to: "visible"
      OpacityAnimator {
        target: rsWidgetRect;
        from: 0;
        to: 1;
        duration: 500;
        running: true
      }
    }

    color: "#ff1b1b1b" 

    implicitWidth: rsWidget.implicitWidth + 10
    implicitHeight: rsWidget.implicitHeight + 10
    radius: 5
    anchors {
      centerIn: parent
    }

    RedshiftWidget {
      id: rsWidget
      implicitWidth: 30
      implicitHeight: 30

      anchors {
        centerIn: parent
      }
    }
  }
}
