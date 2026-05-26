import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root

    property var visibleIcons: []
    property var selectedIcon: null
    property string searchText: ""
    property string textFont: ""
    property int iconSize: 22
    property int iconWeight: Font.Normal
    property bool showIconName: true
    property bool showCodepoint: false
    readonly property int referenceColumnWidth: 80

    signal searchChanged(string text)
    signal iconChosen(var icon)

    radius: 14
    color: "#fbfbfd"
    border.color: "#e3e3e8"
    border.width: 1

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 12
        spacing: 10

        BrowserSearchBar {
            Layout.fillWidth: true
            text: root.searchText
            textFont: root.textFont

            onSearchChanged: function(text) {
                root.searchChanged(text)
            }
        }

        GridView {
            id: gridView

            Layout.fillWidth: true
            Layout.fillHeight: true
            readonly property int columnCount: Math.max(1, Math.floor(width / root.referenceColumnWidth))
            readonly property int computedCellWidth: Math.max(1, Math.floor(width / columnCount))
            readonly property int cellPadding: 4
            model: root.visibleIcons
            cellWidth: computedCellWidth
            cellHeight: cellWidth
            boundsBehavior: Flickable.StopAtBounds
            flickableDirection: Flickable.VerticalFlick
            clip: true

            ScrollBar.vertical: BrowserGridScrollBar {
            }

            ScrollBar.horizontal: ScrollBar {
                policy: ScrollBar.AlwaysOff
            }

            delegate: Item {
                required property var modelData

                width: gridView.cellWidth
                height: gridView.cellHeight

                IconGridCard {
                    anchors.fill: parent
                    anchors.margins: 6
                    iconData: modelData
                    selected: root.selectedIcon && root.selectedIcon.name === modelData.name
                    showName: root.showIconName
                    showCodepoint: root.showCodepoint
                    iconSize: root.iconSize
                    iconWeight: root.iconWeight
                    textFont: root.textFont

                    onClicked: {
                        root.iconChosen(modelData)
                    }
                }
            }
        }
    }
}