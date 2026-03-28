cmake_minimum_required(VERSION 4.0.0)

project(
        "project_name"
        VERSION 0.0.0
        DESCRIPTION ""
        LANGUAGES CXX
)

list(APPEND CMAKE_MODULE_PATH
        "${PROJECT_SOURCE_DIR}/cmake/modules"
)

option(BUILD_APP "Build project" ON)
option(BUILD_DOC_HTML "Build html documentation" OFF)
option(BUILD_DOC_PDF "Build pdf documentation" OFF)
option(BUILD_SHARED_LIBS "Build shared library" OFF)
option(BUILD_TESTS "Build unit tests" ON)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")

find_package(Git REQUIRED)

include(FetchContent)

if(BUILD_APP OR BUILD_TESTS)

    include(fetchNlohmannJson)
    include(fetchSpdlog)
    include(makeCompileOptions)
    include(makeCompileDefinitions)

    add_subdirectory(modules)
    add_subdirectory(apps)
endif()

if(BUILD_TESTS)
    include(fetchGoogleTest)
    enable_testing()
    add_subdirectory(tests)
endif()

if(BUILD_DOC_HTML OR BUILD_DOC_PDF)
    include(fetchDoxygen)
    include(makeDoc)
endif()
