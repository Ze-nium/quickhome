import Quickshell
import Quickshell.Io
import QtQuick

// Local Folder imports
import qs.Windows
import qs.Widgets
import qs.Auxiliary
import qs.Lockscreen

ShellRoot {
    Bar {}
    Dashboard {}
    LockSurface {
        id: locker
    }
    IpcHandler {
        target: "locker"
        function setLock(isLocked: bool): void {
            if (isLocked) {
                locker.locked = true;
            }
        }
    }
}
