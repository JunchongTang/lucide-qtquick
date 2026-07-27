qt_add_executable(LucideIconBrowser
    main.cpp
)

qt_add_qml_module(LucideIconBrowser
    URI LucideIconBrowserApp
    VERSION 1.0
    QML_FILES
        Main.qml
)

target_link_libraries(LucideIconBrowser
    PRIVATE
        Qt6::Quick
        LucideIcons
        LucideIconsplugin
)

set_target_properties(LucideIconBrowser PROPERTIES
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)
