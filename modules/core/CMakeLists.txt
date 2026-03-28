set(MODULE_NAME "${PROJECT_PREFIX}_core")
set(INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/include")

file(GLOB_RECURSE SOURCES
        "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
)
file(GLOB_RECURSE HEADERS
        "${INCLUDE_DIR}/*.hpp"
)

add_library(${MODULE_NAME} ${SOURCES})

target_sources(${MODULE_NAME}
        PRIVATE ${SOURCES}
        PUBLIC FILE_SET HEADERS
        BASE_DIRS ${INCLUDE_DIR}
        FILES ${HEADERS}
)

target_include_directories(${MODULE_NAME}
        PRIVATE ${INCLUDE_DIR}
        PUBLIC
        $<BUILD_INTERFACE:${INCLUDE_DIR}>
        $<INSTALL_INTERFACE:include>
)

target_link_libraries(${MODULE_NAME}
        PRIVATE
        _compile_options
        nlohmann_json::nlohmann_json
)
