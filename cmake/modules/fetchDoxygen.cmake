find_package(Doxygen QUIET CONFIG)
if (NOT Doxygen_FOUND)

    set(DOXYGEN_VERSION "1.16.1")
    message(STATUS "Fetching Doxygen ${DOXYGEN_VERSION}")

    if(WIN32)
        set(DOXYGEN_URL "https://www.doxygen.nl/files/doxygen-${DOXYGEN_VERSION}.windows.x64.bin.zip")
        set(DOXYGEN_EXECUTABLE_NAME "doxygen.exe")
    elseif(UNIX AND NOT APPLE)
        set(DOXYGEN_URL "https://www.doxygen.nl/files/doxygen-${DOXYGEN_VERSION}.linux.bin.tar.gz")
        set(DOXYGEN_EXECUTABLE_NAME "doxygen")
    else()
        set(DOXYGEN_URL "https://www.doxygen.nl/files/doxygen-${DOXYGEN_VERSION}-mac-arm.zip")
        set(DOXYGEN_EXECUTABLE_NAME "doxygen")
    endif()

    FetchContent_Declare(
            doxygen_bin
            URL ${DOXYGEN_URL}
            DOWNLOAD_EXTRACT_TIMESTAMP TRUE
    )

    FetchContent_GetProperties(doxygen_bin)
    if(NOT doxygen_bin_POPULATED)
        FetchContent_MakeAvailable(doxygen_bin)
    endif()

    file(GLOB_RECURSE DOXYGEN_EXEC_FOUND
            "${doxygen_bin_SOURCE_DIR}/${DOXYGEN_EXECUTABLE_NAME}"
    )
    list(GET DOXYGEN_EXEC_FOUND 0 DOXYGEN_EXECUTABLE)

    if(NOT EXISTS "${DOXYGEN_EXECUTABLE}")
        message(FATAL_ERROR "Cannot find Doxygen after dl. SOURCE_DIR=${doxygen_bin_SOURCE_DIR}")
    endif()

    message(STATUS "Found Doxygen: ${DOXYGEN_EXECUTABLE}")

endif ()

set(DOXYGEN_CSS_VERSION "2.4.2")
message(STATUS "Fetching Doxygen-awesome-css ${DOXYGEN_CSS_VERSION}")

file(DOWNLOAD "https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v${DOXYGEN_CSS_VERSION}/doxygen-awesome.css"
        "${CMAKE_CURRENT_BINARY_DIR}/documentation/css/doxygen-awesome.css")
file(DOWNLOAD "https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v${DOXYGEN_CSS_VERSION}/doxygen-awesome-sidebar-only.css"
        "${CMAKE_CURRENT_BINARY_DIR}/documentation/css/doxygen-awesome-sidebar-only.css")
