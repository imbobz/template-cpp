set(APP_NAME "${PROJECT_NAME}_cli")

add_executable(${APP_NAME}
        "${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp"
)

target_include_directories(${APP_NAME} PRIVATE
        "${CMAKE_CURRENT_SOURCE_DIR}/include"
)

target_link_libraries(${APP_NAME} PRIVATE
        ${PROJECT_NAME}::compile_options
        ${PROJECT_NAME}::compile_definitions
        ${PROJECT_NAME}::core
        spdlog::spdlog
)
