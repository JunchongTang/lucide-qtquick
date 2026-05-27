set(lucide_resources
    assets/lucide.ttf
    assets/lucide_codepoints.js
)

set_source_files_properties(
    Lucide.qml
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE
)

qt6_add_qml_module(LucideIcons
    STATIC
    URI LucideIcons
    VERSION 1.0
    RESOURCE_PREFIX "/qt/qml"
    OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/LucideIcons"
    QML_FILES
        Lucide.qml
        LucideIcon.qml
    RESOURCES
        ${lucide_resources}
)

target_link_libraries(LucideIcons PRIVATE Qt6::Quick)
