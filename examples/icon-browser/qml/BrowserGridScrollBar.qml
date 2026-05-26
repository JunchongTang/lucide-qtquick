import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic as Basic

Basic.ScrollBar {
    id: control

    implicitWidth: 12
    policy: ScrollBar.AsNeeded
    minimumSize: 0.12

    background: Rectangle {
        implicitWidth: 12
        radius: 6
        color: "#eef0f3"
    }

    contentItem: Rectangle {
        implicitWidth: 8
        radius: 4
        color: control.pressed ? "#8c9199" : "#aeb4bc"
    }
}