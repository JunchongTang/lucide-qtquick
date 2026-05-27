pragma Singleton
import QtQuick
import "assets/lucide_codepoints.js" as Codepoints

Item {
    id: root

    readonly property string family: (fontLoader.name && fontLoader.name.length > 0)
                                   ? fontLoader.name
                                   : "lucide"

    function glyph(name) {
        return Codepoints.glyph(name)
    }

    function hasGlyph(name) {
        return Codepoints.hasGlyph(name)
    }

    function iconNames() {
        return Codepoints.names()
    }

    FontLoader {
        id: fontLoader
        source: Qt.resolvedUrl("assets/lucide.ttf")
    }
}
