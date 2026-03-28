find_package(nlohmann_json QUIET CONFIG)
if (NOT nlohmann_json_FOUND)

    set(NLOHMANNJSON_VERSION "3.12.0")
    message(STATUS "Fetching nlohmann-json ${NLOHMANNJSON_VERSION}")

    FetchContent_Declare(
            nlohmann-json
            GIT_REPOSITORY "https://github.com/nlohmann/json.git"
            GIT_TAG        "v${NLOHMANNJSON_VERSION}"
            GIT_SHALLOW    TRUE
            GIT_PROGRESS   TRUE
    )
    FetchContent_MakeAvailable(nlohmann-json)
endif ()
