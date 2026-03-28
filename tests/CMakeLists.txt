set(APP_NAME "${PROJECT_PREFIX}_tests")

file(GLOB_RECURSE SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")

add_executable(${APP_NAME} ${SOURCES})

target_link_libraries(${APP_NAME} PRIVATE
        GTest::gtest_main
)

include(GoogleTest)
gtest_discover_tests(${APP_NAME})
