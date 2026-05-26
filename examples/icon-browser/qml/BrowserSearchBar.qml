import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic as Basic
import QtQuick.Layouts

Rectangle {
    id: root

    property alias text: searchField.text
    property string textFont: ""

    signal searchChanged(string text)

    radius: 10
    color: "#ffffff"
    border.color: "#e5e5ea"
    border.width: 1
    implicitHeight: 34

    Basic.TextField {
        id: searchField

        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        placeholderText: "Search name, className, prefix or unicode"
        selectByMouse: true
        font.family: root.textFont
        font.pixelSize: 12
        color: "#1d1d1f"
        verticalAlignment: TextInput.AlignVCenter
        background: Item {}

        onTextChanged: {
            root.searchChanged(text)
        }
    }
}