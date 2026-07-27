# lucide-qtquick

[English](README.md) | **简体中文**

一个面向 Qt Quick / QML 的 [Lucide](https://lucide.dev) 图标模块,适合通过源码方式接入别的 Qt 工程。

## 环境要求

- CMake 3.21+
- Qt 6.5+
- C++17

## 集成

把仓库放进你的工程后,通过 `add_subdirectory(...)` 引入:

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

## 使用

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

也可以使用 `Lucide` 单例:

- `Lucide.glyph(name)`
- `Lucide.hasGlyph(name)`
- `Lucide.iconNames()`
- `Lucide.family`

## 说明

当前仓库主要面向源码引入,不是安装式发布包。

## 许可

图标来自 [Lucide](https://lucide.dev)(ISC 许可证)。见 [LICENSE](LICENSE)。
