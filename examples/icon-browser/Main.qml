import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import LucideIcons 1.0
import "assets/lucide_browser_data.js" as BrowserData
import "qml"

ApplicationWindow {
    id: window

    width: 1120
    height: 680
    visible: true
    title: "Lucide Icon Browser"

    property string searchText: ""
    property var visibleIcons: []
    property var selectedIcon: null
    property int iconSize: 22
    property int iconWeight: Font.Normal
    property bool showIconName: true
    property bool showCodepoint: false
    readonly property int iconCount: visibleIcons ? visibleIcons.length : 0
    readonly property bool hasSelection: selectedIcon !== null
    readonly property string displayFont: ""
    readonly property string textFont: ""

    color: "#f5f5f7"

    function applyFilter() {
        visibleIcons = BrowserData.filteredIcons(searchText)

        if (visibleIcons.length === 0) {
            selectedIcon = null
            return
        }

        if (!selectedIcon) {
            selectedIcon = visibleIcons[0]
            return
        }

        for (var index = 0; index < visibleIcons.length; ++index) {
            if (visibleIcons[index].name === selectedIcon.name)
                return
        }

        selectedIcon = visibleIcons[0]
    }

    function iconSnippet(icon) {
        if (!icon)
            return ""

        var snippet = "LucideIcon {\n"
                + "    name: \"" + icon.name + "\"\n"
                + "    size: " + iconSize + "\n"

        if (iconWeight !== Font.Normal)
            snippet += "    weight: " + iconWeight + "\n"

        snippet += "}"

        return snippet
    }

    Component.onCompleted: {
        applyFilter()
    }

    SplitView {
        anchors.fill: parent
        anchors.margins: 12
        orientation: Qt.Horizontal

        handle: Item {
            implicitWidth: 10
            //color: "transparent"

            // Rectangle {
            //     anchors.centerIn: parent
            //     width: 1
            //     height: parent.height - 16
            //     radius: 1
            //     color: "#d9dde3"
            // }
        }

        BrowserSidebar {
            SplitView.fillHeight: true
            SplitView.minimumWidth: 176
            SplitView.preferredWidth: 196
            displayFont: window.displayFont
            textFont: window.textFont
            selectedIcon: window.selectedIcon
            hasSelection: window.hasSelection
            iconCount: window.iconCount
            summaryText: searchText.length === 0
                         ? "info.json metadata browser"
                         : "showing " + iconCount + " results"
            snippetText: window.iconSnippet(window.selectedIcon)
            iconSize: window.iconSize
            iconWeight: window.iconWeight
            showIconName: window.showIconName
            showCodepoint: window.showCodepoint

            onIconSizeSelected: function(value) {
                window.iconSize = value
            }

            onIconWeightSelected: function(value) {
                window.iconWeight = value
            }

            onIconNameVisibilitySelected: function(value) {
                window.showIconName = value
            }

            onCodepointVisibilitySelected: function(value) {
                window.showCodepoint = value
            }
        }

        IconBrowserPane {
            SplitView.fillWidth: true
            SplitView.fillHeight: true
            SplitView.minimumWidth: 420
            textFont: window.textFont
            searchText: window.searchText
            visibleIcons: window.visibleIcons
            selectedIcon: window.selectedIcon
            iconSize: window.iconSize
            iconWeight: window.iconWeight
            showIconName: window.showIconName
            showCodepoint: window.showCodepoint

            onSearchChanged: function(text) {
                window.searchText = text
                window.applyFilter()
            }

            onIconChosen: function(icon) {
                window.selectedIcon = icon
            }
        }
    }
}
