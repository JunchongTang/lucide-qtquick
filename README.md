# lucide-qtquick

**English** | [简体中文](README.zh-CN.md)

[![License: MIT](https://img.shields.io/badge/License-MIT-informational.svg)](LICENSE)
![Qt 6.5+](https://img.shields.io/badge/Qt-6.5%2B-41cd52.svg)
![C++17](https://img.shields.io/badge/C%2B%2B-17-00599c.svg)

A [Lucide](https://lucide.dev) icon module for Qt Quick / QML, meant to be consumed
from source in other Qt projects.

## Requirements

- CMake 3.21+
- Qt 6.5+
- C++17

## Integration

Drop the repository into your project and pull it in with `add_subdirectory(...)`:

```cmake
find_package(Qt6 6.5 REQUIRED COMPONENTS Quick Qml)

qt_standard_project_setup()

set(LUCIDE_QTQUICK_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
add_subdirectory(third_party/lucide-qtquick)

qt_add_executable(MyApp
    main.cpp
)

qt_add_qml_module(MyApp
    URI MyApp
    VERSION 1.0
    QML_FILES
        Main.qml
)

target_link_libraries(MyApp
    PRIVATE
        Qt6::Quick
        LucideIcons
        LucideIconsplugin
)
```

## Usage

```qml
import QtQuick
import LucideIcons 1.0

Rectangle {
    width: 120
    height: 120
    color: "white"

    LucideIcon {
        anchors.centerIn: parent
        name: "search"
        size: 28
        color: "#0071e3"
    }
}
```

You can also use the `Lucide` singleton:

- `Lucide.glyph(name)`
- `Lucide.hasGlyph(name)`
- `Lucide.iconNames()`
- `Lucide.family`

## Notes

This repository is intended for source-based integration; it is not published as an
installable package.

## License

This module is released under the [MIT License](LICENSE). The icon glyphs are from
[Lucide](https://lucide.dev), licensed under ISC.
