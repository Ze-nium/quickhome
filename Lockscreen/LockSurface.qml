pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import Quickshell.Widgets

WlSessionLock {
    id: lock

    WlSessionLockSurface {
        Button {
            text: "Unlock me"
            onClicked: lock.locked = false
        }
    }

    IpcHandler {
        target: "lock"

        function setLock(isLocked: bool): void {
            if (isLocked) {
                lock.locked = true;
            }
        }
    }
}
