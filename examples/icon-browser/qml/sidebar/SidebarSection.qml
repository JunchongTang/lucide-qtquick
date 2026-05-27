import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root

    property string title: ""
    property string description: ""
    property string textFont: ""
    default property alias contentData: contentColumn.data

    implicitHeight: sectionLayout.implicitHeight
    Layout.fillWidth: true

    ColumnLayout {
        id: sectionLayout

        anchors.fill: parent
        spacing: 6

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 3

            Label {
                visible: root.title.length > 0
                text: root.title
                color: "#1d1d1f"
                font.pixelSize: 12
                font.family: root.textFont
                font.weight: Font.DemiBold
            }

            Label {
                visible: root.description.length > 0
                Layout.fillWidth: true
                text: root.description
                color: "#6e6e73"
                font.pixelSize: 10
                font.family: root.textFont
                wrapMode: Text.WrapAnywhere
            }
        }

        Rectangle {
            Layout.fillWidth: true
            height: 1
            color: "#eceef2"
        }

        ColumnLayout {
            id: contentColumn

            Layout.fillWidth: true
            spacing: 6
        }
    }
}