import QtQuick
import LucideIcons 1.0

Item {
    id: root

    property string name: ""
    property string fallback: ""
    property int size: 16
    property int weight: Font.Normal
    property alias color: glyphText.color

    implicitWidth: size
    implicitHeight: size
    width: implicitWidth
    height: implicitHeight

    Text {
        id: glyphText
        anchors.centerIn: parent
        color: "#000000"
        text: {
            var icon = Lucide.glyph(root.name)
            return icon.length > 0 ? icon : root.fallback
        }
        font.family: Lucide.family
        font.pixelSize: root.size
        font.weight: root.weight
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
}
