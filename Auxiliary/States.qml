pragma Singleton

import Quickshell

// Singleton for the Dashboard, as Qt does not have closures to expose Dashboard's children to Bar
Singleton {
    property string shown: "hidden"
}
