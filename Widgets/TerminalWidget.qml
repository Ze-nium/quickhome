import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import QtQuick


// Clipping rectangle is used to prevent text from overflowing the parent rectangle
ClippingRectangle {
  anchors.centerIn: parent
  implicitWidth: 400
  implicitHeight: 20

  color: "#ff353636"
  
  TextInput {
    id: terminalInput
    color: "white"

    font.family: "Open Sans"

    // Clear the text upon entering a newline (pressing enter)
    onAccepted: { 
      console.log("Terminal received editingFinished signal"); 
      console.log("Now sending input to bash process", this.text);
      bashProc.exec(["bash", "-c", this.text]);
      this.clear();
    }

    anchors {
      left: parent.left
      right: parent.right
    }

  }

  Process {
    id: bashProc
    running: true
    stdout: StdioCollector { 
      waitForEnd: false
      onStreamFinished: console.log("Terminal output:", this.text)
    }
    onExited: {
      console.warn("Bash process exited"); 
    }
    onStarted: console.log("Bash process started")
  }
}

