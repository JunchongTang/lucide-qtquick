cmake_minimum_required(VERSION 3.21)

project(lucide-qtquick VERSION 1.8.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

option(LUCIDE_QTQUICK_BUILD_EXAMPLES "Build lucide-qtquick examples" ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick Qml)

qt_policy(SET QTP0001 NEW)

qt_standard_project_setup()

add_subdirectory(src)

if(LUCIDE_QTQUICK_BUILD_EXAMPLES)
    add_subdirectory(examples/icon-browser)
endif()
