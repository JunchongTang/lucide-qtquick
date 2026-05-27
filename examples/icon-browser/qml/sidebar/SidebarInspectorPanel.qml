import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components" as Components

Rectangle {
    id: root

    property bool hasSelection: false
    property var selectedIcon: null
    property int iconCount: 0
    property string displayFont: ""
    property string textFont: ""
    property string summaryText: ""
    property string selectedName: qsTr("No selection")
    property string selectedCode: qsTr("Pick an icon from the grid to inspect its metadata.")
    property string selectedClassName: ""
    property int iconSize: 22
    property int iconWeight: Font.Normal
    property string weightLabel: ""
    property bool showIconName: true
    property bool showCodepoint: false

    signal iconSizeSelected(int value)
    signal iconWeightSelected(int value)
    signal iconNameVisibilitySelected(bool value)
    signal codepointVisibilitySelected(bool value)

    radius: 8
    color: "#ffffff"
    border.color: "#e5e5ea"
    border.width: 1
    Layout.fillWidth: true
    Layout.fillHeight: true

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 8
        spacing: 8

        RowLayout {
            Label {
                Layout.fillWidth: true
                text: qsTr("Lucide Icons") 
                color: "#1d1d1f"
                font.pixelSize: 14
                font.family: root.textFont
                font.weight: Font.DemiBold
            }
            Rectangle {
                radius: 999
                color: "#f2f2f5"
                border.color: "#dddee3"
                border.width: 1
                implicitWidth: 56
                implicitHeight: 24

                Label {
                    anchors.centerIn: parent
                    text: root.iconCount + qsTr(" icons")
                    color: "#1d1d1f"
                    font.pixelSize: 9
                    font.family: root.textFont
                    font.weight: Font.Medium
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            height: 1
            color: "#eceef2"
        }

        ScrollView {
            id: inspectorView

            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            contentWidth: availableWidth
            contentHeight: inspectorContent.implicitHeight

            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

            ColumnLayout {
                id: inspectorContent

                width: inspectorView.availableWidth
                spacing: 10

                SidebarSection {
                    title: qsTr("Display")
                    description: qsTr("Adjust the preview and the grid presentation.")
                    textFont: root.textFont

                    Components.SliderField {
                        title: qsTr("Size")
                        valueText: qsTr("%1 px").arg(root.iconSize)
                        textFont: root.textFont
                        from: 14
                        to: 30
                        stepSize: 1
                        value: root.iconSize

                        onValueMoved: function(value) {
                            root.iconSizeSelected(Math.round(value))
                        }
                    }

                    Components.SliderField {
                        title: qsTr("Weight")
                        valueText: root.weightLabel
                        textFont: root.textFont
                        from: 1
                        to: 1000
                        stepSize: 1
                        value: root.iconWeight

                        onValueMoved: function(value) {
                            root.iconWeightSelected(Math.round(value))
                        }
                    }
                }

                SidebarSection {
                    title: qsTr("Visibility")
                    description: qsTr("Choose what each grid card should expose.")
                    textFont: root.textFont

                    // 控制图标卡片是否显示图标名称。
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 8

                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 2

                            Label {
                                text: qsTr("Show name")
                                color: "#1d1d1f"
                                font.pixelSize: 10
                                font.family: root.textFont
                                font.weight: Font.DemiBold
                            }

                            Label {
                                Layout.fillWidth: true
                                text: qsTr("Display the readable icon key under each item.")
                                color: "#6e6e73"
                                font.pixelSize: 9
                                font.family: root.textFont
                                wrapMode: Text.WrapAnywhere
                            }
                        }

                        Components.ToggleField {
                            checked: root.showIconName

                            onToggled: {
                                root.iconNameVisibilitySelected(checked)
                            }
                        }
                    }

                    // 控制图标卡片是否显示码点值。
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 8

                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 2

                            Label {
                                text: qsTr("Show codepoint")
                                color: "#1d1d1f"
                                font.pixelSize: 10
                                font.family: root.textFont
                                font.weight: Font.DemiBold
                            }

                            Label {
                                Layout.fillWidth: true
                                text: qsTr("Display the encoded glyph value below the name.")
                                color: "#6e6e73"
                                font.pixelSize: 9
                                font.family: root.textFont
                                wrapMode: Text.WrapAnywhere
                            }
                        }

                        Components.ToggleField {
                            checked: root.showCodepoint

                            onToggled: {
                                root.codepointVisibilitySelected(checked)
                            }
                        }
                    }
                }
            }
        }
    }
}