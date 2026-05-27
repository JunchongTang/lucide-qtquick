import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic as Basic
import QtQuick.Layouts
import "../components" as Components

Rectangle {
    id: root

    property bool hasSelection: false
    property int iconCount: 0
    property string displayFont: ""
    property string textFont: ""
    property string summaryText: ""
    property string snippetText: ""
    property var selectedIcon: null
    property string selectedName: qsTr("No selection")
    property string selectedCode: qsTr("Pick an icon from the grid to inspect its metadata.")
    property string selectedClassName: ""
    property int iconSize: 22
    property int iconWeight: Font.Normal

    radius: 8
    color: "#ffffff"
    border.color: "#e5e5ea"
    border.width: 1
    Layout.fillWidth: true
    implicitHeight: contentLayout.implicitHeight + 12
    Layout.preferredHeight: implicitHeight

    ColumnLayout {
        id: contentLayout

        anchors.fill: parent
        anchors.margins: 6
        spacing: 3

        Label {
            text: qsTr("Metadata and display")
            color: "#1d1d1f"
            font.pixelSize: 14
            font.family: root.displayFont
            font.weight: Font.DemiBold
        }

        SidebarSelectionSummary {
            Layout.fillWidth: true
            hasSelection: root.hasSelection
            selectedIcon: root.selectedIcon
            selectedName: root.selectedName
            selectedCode: root.selectedCode
            selectedClassName: root.selectedClassName
            textFont: root.textFont
            displayFont: root.displayFont
            iconSize: root.iconSize
            iconWeight: root.iconWeight
        }
        
        RowLayout {
            Layout.fillWidth: true

            Basic.Label {
                Layout.fillWidth: true
                text: qsTr("QML")
                color: "#6e6e73"
                font.pixelSize: 7
                font.family: root.textFont
                font.weight: Font.DemiBold
            }

            
        }

        Basic.TextArea {
            id: codeSnippet
            Layout.fillWidth: true
            Layout.preferredHeight: 72
            readOnly: true
            selectByMouse: true
            text: root.snippetText
            color: "#1d1d1f"
            font.family: "Menlo"
            font.pixelSize: 7
            wrapMode: TextEdit.NoWrap
            background: Rectangle {
                color: "#f2f2f5"
                border.color: "#dddee3"
                border.width: 1
                radius: 4
            }

            Components.CopyIconButton {
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.margins: 4
                textToCopy: codeSnippet.text
                textFont: root.textFont
            }
        }
    }
}