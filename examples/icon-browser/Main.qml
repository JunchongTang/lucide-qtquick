pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Window
import LucideIcons
import "assets/lucide_browser_data.js" as BrowserData

// Minimal Lucide icon browser: a search box on top and a grid of every icon
// below. Mirrors the layout of lucide.dev, kept to a single file for clarity.
// The grid model is the generated data table (name/label/className/codepoint),
// so the search matches names, labels, class names and unicode values alike.
Window {
    id: win
    width: 960
    height: 640
    visible: true
    color: "#ffffff"
    title: qsTr("Lucide Icons")

    property string query: ""
    readonly property int iconCount: BrowserData.icons.length
    readonly property var shown: BrowserData.filteredIcons(query)

    Column {
        anchors.fill: parent
        anchors.margins: 24
        spacing: 20

        // Search box
        Rectangle {
            id: searchBox
            width: parent.width
            height: 52
            radius: 12
            color: "#f4f4f5"
            border.width: search.activeFocus ? 1 : 0
            border.color: "#d4d4d8"

            LucideIcon {
                id: searchIcon
                anchors.left: parent.left
                anchors.leftMargin: 16
                anchors.verticalCenter: parent.verticalCenter
                name: "search"
                size: 20
                color: "#71717a"
            }

            TextInput {
                id: search
                anchors.left: searchIcon.right
                anchors.leftMargin: 12
                anchors.right: parent.right
                anchors.rightMargin: 16
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 16
                color: "#18181b"
                clip: true
                selectByMouse: true
                onTextChanged: win.query = text.trim().toLowerCase()

                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    visible: search.text.length === 0
                    text: qsTr("Search %1 icons…").arg(win.iconCount)
                    font: search.font
                    color: "#a1a1aa"
                }
            }
        }

        // Icon grid
        GridView {
            id: grid
            width: parent.width
            height: parent.height - searchBox.height - parent.spacing
            // Fill the row exactly: pick a whole column count near ~84px, then
            // divide the width by it so there is no leftover gap on the right.
            cellWidth: width / Math.max(1, Math.round(width / 84))
            cellHeight: cellWidth
            clip: true
            boundsBehavior: Flickable.StopAtBounds
            model: win.shown

            delegate: Item {
                id: tile
                required property var modelData
                width: grid.cellWidth
                height: grid.cellHeight

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 5
                    radius: 12
                    color: hover.hovered ? "#f4f4f5" : "transparent"
                    Behavior on color { ColorAnimation { duration: 90 } }
                }

                LucideIcon {
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: 22
                    name: tile.modelData.name
                    size: 26
                    color: "#18181b"
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 12
                    width: tile.width - 12
                    visible: hover.hovered
                    text: tile.modelData.name
                    font.pixelSize: 10
                    color: "#71717a"
                    elide: Text.ElideRight
                    horizontalAlignment: Text.AlignHCenter
                }

                HoverHandler { id: hover }
            }
        }
    }
}
