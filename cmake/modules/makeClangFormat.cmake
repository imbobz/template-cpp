find_program(CLANG_FORMAT_EXECUTABLE NAMES clang-format)


if(NOT CLANG_FORMAT_EXECUTABLE)
    message(STATUS "clang-format Not found – formatting targets disabled")
    function(enable_clang_format target)
    endfunction()
    return()
endif()

message(STATUS "clang-format Found: ${CLANG_FORMAT_EXECUTABLE}")

set(_ALL_FORMAT_SOURCES "" CACHE INTERNAL "")

function(enable_clang_format target)
    get_target_property(_sources    ${target} SOURCES)
    get_target_property(_source_dir ${target} SOURCE_DIR)

    foreach(_src ${_sources})
        if(_src MATCHES "\\.(cpp|hpp)$")
            if(NOT IS_ABSOLUTE "${_src}")
                set(_src "${_source_dir}/${_src}")
            endif()
            set(_ALL_FORMAT_SOURCES ${_ALL_FORMAT_SOURCES} "${_src}" CACHE INTERNAL "")
        endif()
    endforeach()
endfunction()