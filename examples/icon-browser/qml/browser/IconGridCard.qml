import QtQuick
import QtQuick.Controls
import LucideIcons 1.0

Rectangle {
    id: root

    property var iconData: null
    property real cardWidth: 72
    property bool selected: false
    property bool showName: true
    property bool showCodepoint: false
    property int iconSize: 22
    property int iconWeight: Font.Normal
    property string textFont: ""

    signal clicked()

    radius: 10
    color: root.selected ? "#f0f7ff" : "#ffffff"
    border.color: root.selected ? "#0071e3" : "#e8e8ed"
    border.width: 1
    width: root.cardWidth
    height: {
        if (root.showCodepoint)
            return 66

        if (root.showName)
            return 60

        return 52
    }

    Column {
        anchors.fill: parent
        anchors.margins: 6
        spacing: 2

        Item {
            width: parent.width
            height: root.showName || root.showCodepoint ? 34 : parent.height

            LucideIcon {
                anchors.centerIn: parent
                name: root.iconData ? root.iconData.name : ""
                size: root.iconSize
                weight: root.iconWeight
                color: root.selected ? "#0071e3" : "#1d1d1f"
            }
        }

        Label {
            visible: root.showName
            width: parent.width
            text: root.iconData ? root.iconData.name : ""
            horizontalAlignment: Text.AlignHCenter
            elide: Text.ElideMiddle
            wrapMode: Text.NoWrap
            font.family: root.textFont
            font.pixelSize: 9
            font.weight: Font.Medium
            color: "#1d1d1f"
        }

        Label {
            visible: root.showCodepoint
            width: parent.width
            text: root.iconData ? root.iconData.encodedCode : ""
            horizontalAlignment: Text.AlignHCenter
            color: "#8e8e93"
            font.family: root.textFont
            font.pixelSize: 8
        }
    }

    TapHandler {
        onTapped: {
            root.clicked()
        }
    }
}
