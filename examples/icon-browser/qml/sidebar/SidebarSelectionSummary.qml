import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import LucideIcons 1.0
import "../components" as Components

Rectangle {
    id: root

    property bool hasSelection: false
    property var selectedIcon: null
    property string selectedName: qsTr("No selection")
    property string selectedCode: qsTr("Pick an icon from the grid to inspect its metadata.")
    property string selectedClassName: ""
    property string displayFont: ""
    property string textFont: ""
    property int iconSize: 22
    property int iconWeight: Font.Normal

    radius: 8
    color: "#f6f7f9"
    border.color: "#eceef2"
    border.width: 1
    implicitWidth: selectionSummaryLayout.implicitWidth + 16
    implicitHeight: selectionSummaryLayout.implicitHeight + 16

    RowLayout {
        id: selectionSummaryLayout

        anchors.fill: parent
        anchors.margins: 8
        spacing: 8

        Rectangle {
            Layout.preferredWidth: 44
            Layout.preferredHeight: 44
            radius: 8
            color: root.hasSelection ? "#f0f7ff" : "#ffffff"
            border.color: root.hasSelection ? "#0071e3" : "#e5e5ea"
            border.width: 1

            LucideIcon {
                anchors.centerIn: parent
                name: root.hasSelection ? root.selectedIcon.name : ""
                size: Math.max(16, root.iconSize - 4)
                weight: root.iconWeight
                color: root.hasSelection ? "#0071e3" : "#1d1d1f"
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 4

            RowLayout {
                Layout.fillWidth: true
                spacing: 4

                Label {
                    Layout.fillWidth: true
                    text: root.selectedName
                    color: "#1d1d1f"
                    font.pixelSize: 12
                    font.family: root.displayFont
                    font.weight: Font.DemiBold
                    wrapMode: Text.NoWrap
                    elide: Text.ElideRight
                }

                Components.CopyIconButton {
                    visible: root.hasSelection
                    textToCopy: root.selectedName
                }
            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 4

                Label {
                    Layout.fillWidth: true
                    text: root.selectedCode
                    color: "#6e6e73"
                    font.pixelSize: 10
                    font.family: root.textFont
                    wrapMode: Text.NoWrap
                    elide: Text.ElideRight
                }

                Components.CopyIconButton {
                    visible: root.hasSelection
                    textToCopy: root.selectedCode
                }
            }
        }
    }
}