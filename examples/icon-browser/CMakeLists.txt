qt_add_executable(LucideIconBrowser
    main.cpp
)

qt_add_qml_module(LucideIconBrowser
    URI LucideIconBrowserApp
    VERSION 1.0
    QML_FILES
        Main.qml
        qml/BrowserSidebar.qml
        qml/IconBrowserPane.qml
        qml/browser/BrowserSearchBar.qml
        qml/browser/IconGridCard.qml
        qml/components/CopyIconButton.qml
        qml/components/Scroll.qml
        qml/components/SliderField.qml
        qml/components/ToggleField.qml
        qml/sidebar/MetadataRow.qml
        qml/sidebar/SidebarSection.qml
        qml/sidebar/SidebarInspectorPanel.qml
        qml/sidebar/SidebarSelectionSummary.qml
        qml/sidebar/SidebarSnippetPanel.qml
    RESOURCES
        assets/lucide_browser_data.js
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
