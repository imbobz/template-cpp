set(APP_NAME "${PROJECT_NAME}_tests")

add_executable(${APP_NAME}
        "${CMAKE_CURRENT_SOURCE_DIR}/src/oneEqualsOne.cpp"
)

target_link_libraries(${APP_NAME} PRIVATE
        GTest::gtest_main
        ${PROJECT_NAME}::core
        ${PROJECT_NAME}::compile_options
        ${PROJECT_NAME}::compile_definitions
)

include(GoogleTest)
gtest_discover_tests(${APP_NAME})
