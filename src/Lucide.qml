pragma Singleton
import QtQuick
import "assets/lucide_codepoints.js" as Codepoints

Item {
    id: root

    // Upstream Lucide release the bundled font was generated from.
    // Keep in sync with third_party/lucide-font/source.json.
    readonly property string iconsVersion: "1.8.0"

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
