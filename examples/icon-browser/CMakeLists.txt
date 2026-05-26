qt_add_executable(LucideIconBrowser
    main.cpp
)

qt_add_qml_module(LucideIconBrowser
    URI LucideIconBrowserApp
    VERSION 1.0
    QML_FILES
        Main.qml
        qml/BrowserGridScrollBar.qml
        qml/BrowserSidebar.qml
        qml/BrowserSearchBar.qml
        qml/IconBrowserPane.qml
        qml/IconGridCard.qml
        qml/MetadataRow.qml
    RESOURCES
        data/lucide_browser_data.js
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
