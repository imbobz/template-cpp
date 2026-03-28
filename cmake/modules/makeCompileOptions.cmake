set(MODULE_NAME "${PROJECT_PREFIX}_compile_options")

add_library(${MODULE_NAME} INTERFACE)

target_compile_features(${MODULE_NAME} INTERFACE cxx_std_23)

# GCC / Clang
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

# MSVC
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

if(WIN32)
    target_compile_definitions(${MODULE_NAME} INTERFACE
            NOMINMAX
            WIN32_LEAN_AND_MEAN
            _CRT_SECURE_NO_WARNINGS  # remove warning for C std functions
    )
endif()
