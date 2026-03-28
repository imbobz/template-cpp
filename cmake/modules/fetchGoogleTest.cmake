find_package(googletest QUIET CONFIG)
if (NOT googletest_FOUND)
    set(GTEST_VERSION "1.17.0")
    message(STATUS "Fetching GoogleTest ${GTEST_VERSION}")

    FetchContent_Declare(
            googletest
            GIT_REPOSITORY "https://github.com/google/googletest.git"
            GIT_TAG        "v${GTEST_VERSION}"
            GIT_SHALLOW    TRUE
            GIT_PROGRESS   TRUE
    )
    FetchContent_MakeAvailable(googletest)
endif ()
