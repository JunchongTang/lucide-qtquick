import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic as Basic
import QtQuick.Layouts

ColumnLayout {
    id: root

    property string title: ""
    property string valueText: ""
    property string textFont: ""
    property real from: 0
    property real to: 100
    property real stepSize: 1
    property real value: 0

    signal valueMoved(real value)

    Layout.fillWidth: true
    spacing: 4

    RowLayout {
        Layout.fillWidth: true

        Basic.Label {
            text: root.title
            color: "#1d1d1f"
            font.pixelSize: 11
            font.family: root.textFont
            font.weight: Font.DemiBold
        }

        Item {
            Layout.fillWidth: true
        }

        Basic.Label {
            text: root.valueText
            color: "#6e6e73"
            font.pixelSize: 10
            font.family: root.textFont
        }
    }

    Basic.Slider {
        id: slider

        Layout.fillWidth: true
        from: root.from
        to: root.to
        stepSize: root.stepSize
        value: root.value

        background: Rectangle {
            x: slider.leftPadding
            y: slider.topPadding + slider.availableHeight / 2 - height / 2
            width: slider.availableWidth
            height: 4
            radius: 2
            color: "#eceef2"

            Rectangle {
                width: slider.visualPosition * parent.width
                height: parent.height
                radius: parent.radius
                color: "#0071e3"
            }
        }

        handle: Rectangle {
            x: slider.leftPadding + slider.visualPosition * (slider.availableWidth - width)
            y: slider.topPadding + slider.availableHeight / 2 - height / 2
            width: 16
            height: 16
            radius: 8
            color: "#ffffff"
            border.color: "#e3e3e8"
            border.width: 1
        }

        onMoved: {
            root.valueMoved(value)
        }
    }
}