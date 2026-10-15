pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import Quickshell.Widgets
import qs.Auxiliary

WlSessionLock {
    id: lock

    WlSessionLockSurface {
        Rectangle {
            anchors {
                centerIn: parent
                fill: parent
            }

            Image {
                source: "/home/kian/quickshell/Lockscreen/Extras/bg.jpg"
                anchors {
                    centerIn: parent
                    fill: parent
                }
            }

            Button {
                anchors.centerIn: parent
                text: "Unlock me"
                onClicked: lock.locked = false
            }
        }
    }
}
