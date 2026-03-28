set(MODULE_NAME "${PROJECT_NAME}_compile_definitions")

add_library(${MODULE_NAME} INTERFACE)
add_library(${PROJECT_NAME}::compile_definitions ALIAS ${MODULE_NAME})
find_package(Git QUIET)
if(GIT_FOUND)
    execute_process(
            COMMAND ${GIT_EXECUTABLE} rev-parse --short HEAD
            WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
            OUTPUT_VARIABLE _git_commit
            RESULT_VARIABLE _git_result
            ERROR_QUIET
            OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    if(_git_result EQUAL 0)
        set(_commit_value "${_git_commit}")
    else()
        message(WARNING "Unable to retrieve Git commit hash")
        set(_commit_value "unknown")
    endif()
    set(GIT_COMMIT_HASH "${_commit_value}" CACHE STRING "Short Git commit hash" FORCE)
endif()

message(STATUS "Commit hash : ${GIT_COMMIT_HASH}")

target_compile_definitions(${MODULE_NAME} INTERFACE
        PROJECT_BUILD_TYPE="$<CONFIG>"
        PROJECT_COMMIT_HASH="${GIT_COMMIT_HASH}"
        PROJECT_NAME="${PROJECT_NAME}"
        PROJECT_VERSION="${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH}"
)

if(WIN32)
    target_compile_definitions(${MODULE_NAME} INTERFACE
            PLATFORM_WINDOWS
            NOMINMAX
            WIN32_LEAN_AND_MEAN
            _CRT_SECURE_NO_WARNINGS  # remove warning for C std functions
    )
elseif(APPLE)
    target_compile_definitions(${MODULE_NAME} INTERFACE PLATFORM_MACOS)
elseif(ANDROID)
    target_compile_definitions(${MODULE_NAME} INTERFACE PLATFORM_ANDROID)
elseif(UNIX)
    target_compile_definitions(${MODULE_NAME} INTERFACE PLATFORM_LINUX)
else()
    message(WARNING "[${MODULE_NAME}] Unrecognized platform")
endif()