import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components" as Components

RowLayout {
    id: root

    property string title: ""
    property string value: ""
    property string textFont: ""

    visible: root.value.length > 0
    spacing: 2

    Label {
        text: root.title
        color: "#6e6e73"
        font.family: root.textFont
        font.pixelSize: 10
        font.weight: Font.DemiBold
    }

    Item {
        Layout.fillWidth: true
        Layout.fillHeight: true
    }

    Label {
        text: root.value
        wrapMode: Text.WrapAnywhere
        color: "#1d1d1f"
        font.family: root.textFont
        font.pixelSize: 11
    }

    Components.CopyIconButton {
        Layout.alignment: Qt.AlignTop
        textToCopy: root.value
        textFont: root.textFont
    }
}
