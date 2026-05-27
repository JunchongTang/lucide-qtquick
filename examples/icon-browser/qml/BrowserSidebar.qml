import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "sidebar" as Sidebar

Rectangle {
    id: root

    property var selectedIcon: null
    property bool hasSelection: false
    property int iconCount: 0
    property string displayFont: ""
    property string textFont: ""
    property string summaryText: ""
    property string snippetText: ""
    property int iconSize: 22
    property int iconWeight: Font.Normal
    property bool showIconName: true
    property bool showCodepoint: false
    readonly property string selectedName: root.hasSelection ? root.selectedIcon.name : qsTr("No selection")
    readonly property string selectedCode: root.hasSelection ? root.selectedIcon.encodedCode : qsTr("Pick an icon from the grid to inspect its metadata.")
    readonly property string selectedClassName: root.hasSelection ? root.selectedIcon.className : ""

    signal iconSizeSelected(int value)
    signal iconWeightSelected(int value)
    signal iconNameVisibilitySelected(bool value)
    signal codepointVisibilitySelected(bool value)

    radius: 14
    color: "#fbfbfd"
    border.color: "#e3e3e8"
    border.width: 1

    readonly property string weightLabel: {
        if (iconWeight <= Font.Light)
            return qsTr("Light")

        if (iconWeight >= Font.DemiBold)
            return qsTr("Bold")

        return qsTr("Regular")
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 8
        spacing: 8

        Sidebar.SidebarInspectorPanel {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumHeight: 180
            hasSelection: root.hasSelection
            selectedIcon: root.selectedIcon
            iconCount: root.iconCount
            displayFont: root.displayFont
            textFont: root.textFont
            summaryText: root.summaryText
            selectedName: root.selectedName
            selectedCode: root.selectedCode
            selectedClassName: root.selectedClassName
            iconSize: root.iconSize
            iconWeight: root.iconWeight
            weightLabel: root.weightLabel
            showIconName: root.showIconName
            showCodepoint: root.showCodepoint

            onIconSizeSelected: function(value) {
                root.iconSizeSelected(value)
            }

            onIconWeightSelected: function(value) {
                root.iconWeightSelected(value)
            }

            onIconNameVisibilitySelected: function(value) {
                root.iconNameVisibilitySelected(value)
            }

            onCodepointVisibilitySelected: function(value) {
                root.codepointVisibilitySelected(value)
            }
        }

        Sidebar.SidebarSnippetPanel {
            Layout.fillWidth: true
            hasSelection: root.hasSelection
            iconCount: root.iconCount
            displayFont: root.displayFont
            textFont: root.textFont
            summaryText: root.summaryText
            snippetText: root.snippetText
            selectedIcon: root.selectedIcon
            selectedName: root.selectedName
            selectedCode: root.selectedCode
            selectedClassName: root.selectedClassName
            iconSize: root.iconSize
            iconWeight: root.iconWeight
        }
    }
}