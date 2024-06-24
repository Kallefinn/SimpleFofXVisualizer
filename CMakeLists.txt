cmake_minimum_required(VERSION 3.16)

project(PlottingApplication VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.7 REQUIRED COMPONENTS Core Graphs Qml Quick Charts Widgets)


qt_standard_project_setup()

include_directories(Parserthing/ Plotterthing/)
add_subdirectory(Parserthing)
add_subdirectory(Plotterthing)

qt_add_executable(appPlottingApplication
    main.cpp
)


target_link_libraries(appPlottingApplication PRIVATE
    Qt::Core
    Qt::Graphs
    Qt::Qml
    Qt::Quick
    Qt::Charts
    Qt::Widgets
)

qt_add_qml_module(appPlottingApplication
    URI PlottingApplication
    VERSION 1.0
    QML_FILES
        Main.qml
        InputBar.qml
        InputButtons.qml
        Text_Input.qml
        Screen01.qml
        SettingsMenu.qml
        QML_FILES InputHandler.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appPlottingApplication PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appPlottingApplication
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appPlottingApplication
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appPlottingApplication
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

qt_generate_deploy_qml_app_script(
    TARGET appPlottingApplication
    OUTPUT_SCRIPT deploy_script
)
install(SCRIPT ${deploy_script})
