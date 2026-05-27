import QtQuick
import QtQuick.Controls
import LucideIcons 1.0

ToolButton {
    id: root

    property string textToCopy: ""
    property string textFont: ""
    property bool copied: false

    implicitWidth: 24
    implicitHeight: 24
    enabled: root.textToCopy.length > 0
    hoverEnabled: true
    padding: 0

    onClicked: {
        clipboardProxy.text = root.textToCopy
        clipboardProxy.selectAll()
        clipboardProxy.copy()
        clipboardProxy.deselect()
        root.copied = true
        copiedResetTimer.restart()
    }

    ToolTip.visible: hovered
    ToolTip.text: root.copied ? qsTr("Copied") : qsTr("Copy")
    ToolTip.delay: 300

    background: Rectangle {
        radius: 6
        color: root.down ? "#e9edf3" : (root.hovered ? "#f3f5f8" : "transparent")
        border.color: root.hovered ? "#d9dde3" : "transparent"
        border.width: 1
        opacity: root.enabled ? 1.0 : 0.4
    }

    contentItem: LucideIcon {
        name: root.copied ? "copy-check" : "copy"
        size: 14
        color: root.copied ? "#0071e3" : "#6e6e73"
    }

    TextInput {
        id: clipboardProxy

        visible: false
        readOnly: true
    }

    Timer {
        id: copiedResetTimer

        interval: 1200
        onTriggered: {
            root.copied = false
        }
    }
}