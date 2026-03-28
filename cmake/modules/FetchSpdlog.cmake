include_guard(GLOBAL)

find_package(spdlog QUIET CONFIG)
if (NOT spdlog_FOUND)
    set(SPDLOG_VERSION "1.17.0")
    message(STATUS "Fetching spdlog ${SPDLOG_VERSION}")

    FetchContent_Declare(
            spdlog
            GIT_REPOSITORY "https://github.com/gabime/spdlog.git"
            GIT_TAG        "v${SPDLOG_VERSION}"
            GIT_SHALLOW    TRUE
            GIT_PROGRESS   TRUE
    )

    set(SPDLOG_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
    set(SPDLOG_BUILD_TESTS OFF CACHE BOOL "" FORCE)
    set(SPDLOG_BUILD_BENCH OFF CACHE BOOL "" FORCE)
    set(SPDLOG_INSTALL OFF CACHE BOOL "" FORCE)
    FetchContent_MakeAvailable(spdlog)
endif ()
