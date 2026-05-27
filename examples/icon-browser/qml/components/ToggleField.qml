import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic as Basic
import QtQuick.Layouts

Basic.Switch {
    id: root

    spacing: 0
    padding: 0
    implicitWidth: 34
    implicitHeight: 20
    Layout.alignment: Qt.AlignVCenter

    background: Rectangle {
        id: track

        x: 0
        y: Math.round((root.height - height) / 2)
        width: 34
        height: 20
        radius: 10
        color: root.checked ? "#0071e3" : "#e7e8ec"
        border.color: root.checked ? "#0071e3" : "#d5d8de"
        border.width: 1
    }

    indicator: Rectangle {
        x: track.x + (root.checked ? track.width - width - 3 : 3)
        y: track.y + Math.round((track.height - height) / 2)
        width: 14
        height: 14
        radius: 7
        color: "#ffffff"

        Rectangle {
            anchors.fill: parent
            radius: parent.radius
            color: "transparent"
        }
    }

    contentItem: Item {
        implicitWidth: 0
        implicitHeight: 0
    }
}