import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Io

Rectangle {
  color: "#00000000"

  RotationAnimator {
    id: rotator
    running: false
    target: icon
    from: 0;
    to: 45;
    duration: 500
    easing: Easing.OutQuart
  }

  RotationAnimator {
    id: rotatorReverse
    running: false
    target: icon
    from: 45;
    to: 0;
    duration: rotator.duration 
    easing: rotator.easing
  }

  MouseArea {
    anchors.fill: parent
    hoverEnabled: true

    onWheel: (wheel) => {

      // Write to a Bash process that will execute "hyprctl hyprsunset temperature [+/-]100K"
      console.log("RedshiftWidget: Got wheel event:", wheel.angleDelta.y)
      let yAngle = wheel.angleDelta.y
      if (yAngle > 0) {
        bashProc.exec(["bash", "-c", "hyprctl hyprsunset temperature +200K"])
      }
      else if (yAngle < 0) {
        bashProc.exec(["bash", "-c", "hyprctl hyprsunset temperature -200K"])
      };

    }

    onClicked: { 
      bashProc.exec(["bash", "-c", "hyprctl hyprsunset identity"]) 
      redToWhiteAnim.running = true

    }

    onEntered: {
      // console.log("Hover detected!")
      rotator.running = true
    }
    onExited: {
      rotatorReverse.running = true
    }

  }

  Process {
    id: bashProc 
    stdout: StdioCollector {
      onStreamFinished: console.log(this.text)
    }
    running: true
  }

  IconImage {
    id: icon
    source: "file:///home/kian/quickshell/Icons/sun-light-red.svg"
    anchors {
      centerIn: parent
      fill: parent
    }
  }
}

