import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic as Basic
import QtQuick.Layouts
import LucideIcons 1.0

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
            return "Light"

        if (iconWeight >= Font.DemiBold)
            return "Bold"

        return "Regular"
    }

    component ToggleControl: RowLayout {
        property alias text: label.text
        property alias checked: toggle.checked
        signal toggled(bool checked)

        Layout.fillWidth: true

        Label {
            id: label

            color: "#1d1d1f"
            font.pixelSize: 12
            font.family: root.textFont
            font.weight: Font.DemiBold
        }

        Item {
            Layout.fillWidth: true
        }

        Basic.Switch {
            id: toggle

            indicator: Rectangle {
                implicitWidth: 42
                implicitHeight: 24
                radius: 12
                color: parent.checked ? "#ff6a6a" : "#e7e8ec"
                border.color: parent.checked ? "#ff6a6a" : "#d5d8de"
                border.width: 1

                Rectangle {
                    x: toggle.checked ? parent.width - width - 2 : 2
                    y: 2
                    width: 20
                    height: 20
                    radius: 10
                    color: "#ffffff"
                }
            }

            contentItem: Item {
            }

            onToggled: {
                parent.toggled(checked)
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 14
        spacing: 12

        Rectangle {
            Layout.fillWidth: true
            radius: 16
            color: "#ffffff"
            border.color: "#e5e5ea"
            border.width: 1

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 14
                spacing: 8

                RowLayout {
                    Layout.fillWidth: true

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 3

                        Label {
                            text: "Lucide for Qt Quick"
                            color: "#6e6e73"
                            font.pixelSize: 10
                            font.family: root.textFont
                            font.weight: Font.DemiBold
                            font.letterSpacing: 0.8
                        }

                        Label {
                            text: "Browser Control"
                            color: "#1d1d1f"
                            font.pixelSize: 22
                            font.family: root.displayFont
                            font.weight: Font.DemiBold
                        }

                        Label {
                            text: root.summaryText
                            color: "#6e6e73"
                            font.pixelSize: 11
                            font.family: root.textFont
                            wrapMode: Text.WrapAnywhere
                        }
                    }

                    Rectangle {
                        radius: 999
                        color: "#f2f2f5"
                        border.color: "#dddee3"
                        border.width: 1
                        implicitWidth: 78
                        implicitHeight: 26

                        Label {
                            anchors.centerIn: parent
                            text: root.iconCount + " icons"
                            font.pixelSize: 10
                            font.family: root.textFont
                            font.weight: Font.Medium
                            color: "#1d1d1f"
                        }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    radius: 12
                    color: "#f6f7f9"
                    border.color: "#eceef2"
                    border.width: 1

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 10

                        Rectangle {
                            width: 62
                            height: 62
                            radius: 14
                            color: "#ffffff"
                            border.color: "#e5e5ea"
                            border.width: 1

                            LucideIcon {
                                anchors.centerIn: parent
                                name: root.hasSelection ? root.selectedIcon.name : ""
                                size: Math.max(20, root.iconSize + 2)
                                weight: root.iconWeight
                                color: "#1d1d1f"
                            }
                        }

                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 2

                            Label {
                                text: root.hasSelection ? root.selectedIcon.name : "No selection"
                                color: "#1d1d1f"
                                font.pixelSize: 15
                                font.family: root.displayFont
                                font.weight: Font.DemiBold
                                wrapMode: Text.WrapAnywhere
                            }

                            Label {
                                text: root.hasSelection ? root.selectedIcon.encodedCode : "Pick an icon from the grid"
                                color: "#6e6e73"
                                font.pixelSize: 10
                                font.family: root.textFont
                                wrapMode: Text.WrapAnywhere
                            }

                            Label {
                                text: root.hasSelection ? root.selectedIcon.className : ""
                                visible: text.length > 0
                                color: "#8e8e93"
                                font.pixelSize: 10
                                font.family: root.textFont
                                elide: Text.ElideRight
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            radius: 12
            color: "#ffffff"
            border.color: "#e5e5ea"
            border.width: 1

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 8

                Label {
                    text: "Metadata"
                    color: "#6e6e73"
                    font.pixelSize: 10
                    font.family: root.textFont
                    font.weight: Font.DemiBold
                }

                MetadataRow {
                    Layout.fillWidth: true
                    title: "className"
                    value: root.hasSelection ? root.selectedIcon.className : ""
                    textFont: root.textFont
                }

                MetadataRow {
                    Layout.fillWidth: true
                    title: "prefix"
                    value: root.hasSelection ? root.selectedIcon.prefix : ""
                    textFont: root.textFont
                }

                MetadataRow {
                    Layout.fillWidth: true
                    title: "unicode"
                    value: root.hasSelection ? root.selectedIcon.unicode : ""
                    textFont: root.textFont
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            radius: 12
            color: "#ffffff"
            border.color: "#e5e5ea"
            border.width: 1

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 10

                Label {
                    text: "Display"
                    color: "#6e6e73"
                    font.pixelSize: 10
                    font.family: root.textFont
                    font.weight: Font.DemiBold
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 4

                    RowLayout {
                        Layout.fillWidth: true

                        Label {
                            text: "Size"
                            color: "#1d1d1f"
                            font.pixelSize: 12
                            font.family: root.textFont
                            font.weight: Font.DemiBold
                        }

                        Item {
                            Layout.fillWidth: true
                        }

                        Label {
                            text: root.iconSize + " px"
                            color: "#6e6e73"
                            font.pixelSize: 11
                            font.family: root.textFont
                        }
                    }

                    Basic.Slider {
                        id: sizeSlider

                        Layout.fillWidth: true
                        from: 14
                        to: 30
                        stepSize: 1
                        value: root.iconSize

                        background: Rectangle {
                            x: sizeSlider.leftPadding
                            y: sizeSlider.topPadding + sizeSlider.availableHeight / 2 - height / 2
                            width: sizeSlider.availableWidth
                            height: 6
                            radius: 3
                            color: "#eceef2"

                            Rectangle {
                                width: sizeSlider.visualPosition * parent.width
                                height: parent.height
                                radius: parent.radius
                                color: "#ff6a6a"
                            }
                        }

                        handle: Rectangle {
                            x: sizeSlider.leftPadding + sizeSlider.visualPosition * (sizeSlider.availableWidth - width)
                            y: sizeSlider.topPadding + sizeSlider.availableHeight / 2 - height / 2
                            width: 20
                            height: 20
                            radius: 10
                            color: "#ffffff"
                            border.color: "#e3e3e8"
                            border.width: 1
                        }

                        onMoved: {
                            root.iconSizeSelected(Math.round(value))
                        }
                    }
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 4

                    RowLayout {
                        Layout.fillWidth: true

                        Label {
                            text: "Weight"
                            color: "#1d1d1f"
                            font.pixelSize: 12
                            font.family: root.textFont
                            font.weight: Font.DemiBold
                        }

                        Item {
                            Layout.fillWidth: true
                        }

                        Label {
                            text: root.weightLabel
                            color: "#6e6e73"
                            font.pixelSize: 11
                            font.family: root.textFont
                        }
                    }

                    Basic.Slider {
                        id: weightSlider

                        Layout.fillWidth: true
                        from: Font.Light
                        to: Font.Bold
                        stepSize: 1
                        value: root.iconWeight

                        background: Rectangle {
                            x: weightSlider.leftPadding
                            y: weightSlider.topPadding + weightSlider.availableHeight / 2 - height / 2
                            width: weightSlider.availableWidth
                            height: 6
                            radius: 3
                            color: "#eceef2"

                            Rectangle {
                                width: weightSlider.visualPosition * parent.width
                                height: parent.height
                                radius: parent.radius
                                color: "#ff6a6a"
                            }
                        }

                        handle: Rectangle {
                            x: weightSlider.leftPadding + weightSlider.visualPosition * (weightSlider.availableWidth - width)
                            y: weightSlider.topPadding + weightSlider.availableHeight / 2 - height / 2
                            width: 20
                            height: 20
                            radius: 10
                            color: "#ffffff"
                            border.color: "#e3e3e8"
                            border.width: 1
                        }

                        onMoved: {
                            root.iconWeightSelected(Math.round(value))
                        }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    radius: 10
                    color: "#f6f7f9"
                    border.color: "#eceef2"
                    border.width: 1

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 10

                        Label {
                            text: "Visibility"
                            color: "#6e6e73"
                            font.pixelSize: 10
                            font.family: root.textFont
                            font.weight: Font.DemiBold
                        }

                        ToggleControl {
                            text: "Show name"
                            checked: root.showIconName

                            onToggled: function(checked) {
                                root.iconNameVisibilitySelected(checked)
                            }
                        }

                        ToggleControl {
                            text: "Show codepoint"
                            checked: root.showCodepoint

                            onToggled: function(checked) {
                                root.codepointVisibilitySelected(checked)
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            radius: 12
            color: "#ffffff"
            border.color: "#e5e5ea"
            border.width: 1

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 6

                Label {
                    text: "QML"
                    color: "#6e6e73"
                    font.pixelSize: 10
                    font.family: root.textFont
                    font.weight: Font.DemiBold
                }

                Basic.TextArea {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    readOnly: true
                    selectByMouse: true
                    text: root.snippetText
                    color: "#1d1d1f"
                    font.family: "Menlo"
                    font.pixelSize: 10
                    wrapMode: TextEdit.NoWrap
                    background: Item {}
                }
            }
        }
    }
}