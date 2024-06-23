qt_add_library(Parserthing
        parser.cpp)

target_link_libraries(Parserthing
    Qt6::Core)

target_include_directories(Parserthing INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})
