find_program(CLANG_TIDY_EXECUTABLE NAMES clang-tidy)

if(NOT CLANG_TIDY_EXECUTABLE)
    message(STATUS "clang-tidy Not found")
    return()
endif()

message(STATUS "clang-tidy Found: ${CLANG_TIDY_EXECUTABLE}")

function(enable_clang_tidy target)
    set(_cmd "${CLANG_TIDY_EXECUTABLE};--use-color")

    if(RUN_CLANG_TIDY_ERRORS)
        list(APPEND _cmd "--warnings-as-errors=*")
    endif()

    set_target_properties(${target} PROPERTIES CXX_CLANG_TIDY "${_cmd}")
endfunction()