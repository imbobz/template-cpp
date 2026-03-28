set(MODULE_NAME "${PROJECT_NAME}_core")
set(INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/include")

set(SOURCES
        "${CMAKE_CURRENT_SOURCE_DIR}/src/core.cpp"
)
file(GLOB_RECURSE HEADERS
        "${INCLUDE_DIR}/*.hpp"
)

add_library(${MODULE_NAME} STATIC ${SOURCES})
add_library(${PROJECT_NAME}::core ALIAS ${MODULE_NAME})

target_sources(${MODULE_NAME}
        PUBLIC FILE_SET HEADERS
        BASE_DIRS ${INCLUDE_DIR}
        FILES ${HEADERS}
)

target_include_directories(${MODULE_NAME}
        PRIVATE ${INCLUDE_DIR}
)

target_link_libraries(${MODULE_NAME}
        PUBLIC
        ${PROJECT_NAME}::compile_options
        ${PROJECT_NAME}::compile_definitions
        PRIVATE
        nlohmann_json::nlohmann_json
)
