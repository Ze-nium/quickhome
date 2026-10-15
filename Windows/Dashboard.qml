import Quickshell
import QtQuick
import qs.Auxiliary
import qs.Widgets

PanelWindow {
    id: mainWindow
    visible: false

    implicitWidth: 100
    implicitHeight: 100

    color: "#00ffffff"

    Rectangle {
        id: rsWidgetRect
        state: States.shown

        states: [
            State {
                name: "visible"
            },
            State {
                name: "hidden"
            }
        ]

        transitions: [
            Transition {
                from: "hidden"
                to: "visible"
                SequentialAnimation {
                    ScriptAction {
                        script: {
                            mainWindow.visible = true;
                        }
                    }
                    OpacityAnimator {
                        target: rsWidgetRect
                        from: 0
                        to: 1
                        duration: 500
                    }
                }
            },
            Transition {
                from: "visible"
                to: "hidden"
                SequentialAnimation {
                    NumberAnimation {
                        target: rsWidgetRect
                        property: "opacity"
                        from: 1
                        to: 0
                        duration: 500
                    }
                    ScriptAction {
                        script: {
                            console.log("Not running anymore");
                            mainWindow.visible = false;
                        }
                    }
                }
            }
        ]
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
