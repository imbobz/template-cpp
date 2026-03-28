set(MODULE_NAME "${PROJECT_NAME}_compile_options")

add_library(${MODULE_NAME} INTERFACE)
add_library(${PROJECT_NAME}::compile_options ALIAS ${MODULE_NAME})

target_compile_options(${MODULE_NAME} INTERFACE
        $<$<CXX_COMPILER_ID:GNU,Clang,AppleClang>:
            -Wall
            -Wextra
            -Wpedantic
            -Wshadow
            -Wno-unused-parameter
            $<$<CONFIG:Release>:-O3>
            $<$<CONFIG:RelWithDebInfo>:-O2>
            $<$<CONFIG:Debug>:-O0 -g>
        >
)

target_compile_options(${MODULE_NAME} INTERFACE
        $<$<CXX_COMPILER_ID:MSVC>:
            /W4
            /wd4100   # unreferenced formal parameter
            /wd4505   # unreferenced local function
            $<$<CONFIG:Release>:/O2>
            $<$<CONFIG:RelWithDebInfo>:/O2 /Zi>
            $<$<CONFIG:Debug>:/Od /Zi /RTC1>
            /utf-8
        >
)
