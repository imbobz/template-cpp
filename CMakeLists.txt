cmake_minimum_required(VERSION 4.0.0)

project(
        "PROJECT_NAME"
        VERSION 0.0.0
        DESCRIPTION ""
        LANGUAGES CXX
)

list(APPEND CMAKE_MODULE_PATH
        "${PROJECT_SOURCE_DIR}/cmake/modules"
)

set(PROJECT_PREFIX "")

option(BUILD_DOC_HTML "Build html documentation" OFF)
option(BUILD_DOC_PDF "Build pdf documentation" OFF)
option(BUILD_TESTS "Build unit tests" OFF)

find_package(Git REQUIRED)

include(FetchContent)

include(fetchNlohmannJson)

include(makeCompileOptions)

add_subdirectory(modules)
add_subdirectory(apps)

if(BUILD_DOC_HTML OR BUILD_DOC_PDF)
    include(fetchDoxygen)
    include(makeDoc)
endif()

if(BUILD_TESTS)
    include(fetchGoogleTest)
    add_subdirectory(tests)
endif()
