import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ColumnLayout {
    id: root

    property string title: ""
    property string value: ""
    property string textFont: ""

    visible: root.value.length > 0
    spacing: 1

    Label {
        text: root.title
        color: "#6e6e73"
        font.family: root.textFont
        font.pixelSize: 10
        font.weight: Font.DemiBold
    }

    Label {
        Layout.fillWidth: true
        text: root.value
        wrapMode: Text.WrapAnywhere
        color: "#1d1d1f"
        font.family: root.textFont
        font.pixelSize: 10
    }
}
