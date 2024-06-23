qt_add_library(Plotterthing)

target_link_libraries(Plotterthing PRIVATE Qt6::Charts Parserthing)

qt_add_qml_module(Plotterthing
    URI "Plotterthing"
    VERSION 1.0
    QML_FILES
        PlotterUi.qml
    SOURCES
        plotter.h
        plotter.cpp
    DEPENDENCIES
        Qt6::Charts
        Parserthing
    )
