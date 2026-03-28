include_guard(GLOBAL)

set(BUILD_OUT "${CMAKE_CURRENT_BINARY_DIR}/documentation")
set(DOXYFILE_OUT "${BUILD_OUT}/Doxyfile")

configure_file("${CMAKE_CURRENT_SOURCE_DIR}/documentation/.doxygen/Doxyfile" ${DOXYFILE_OUT} @ONLY)

add_custom_target("${PROJECT_PREFIX}_doc_html" ALL
        COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYFILE_OUT}
        WORKING_DIRECTORY "${BUILD_OUT}"
        COMMENT "Building HTML documentation..."
        VERBATIM
)

if(BUILD_DOC_PDF)
    if(WIN32)
        message(WARNING "PDF generation via LaTeX is not supported on Windows. HTML only.")
    else()
        find_program(MAKE_EXECUTABLE make REQUIRED)
        add_custom_command(TARGET "${PROJECT_PREFIX}_doc_latex" POST_BUILD
                WORKING_DIRECTORY "${BUILD_OUT}/latex"
                COMMAND ${MAKE_EXECUTABLE}
                COMMAND ${CMAKE_COMMAND} -E copy
                "refman.pdf"
                "${BUILD_OUT}/${CMAKE_PROJECT_NAME}.pdf"
                BYPRODUCTS "${BUILD_OUT}/${CMAKE_PROJECT_NAME}.pdf"
                COMMENT "Building PDF documentation..."
                VERBATIM
        )
    endif()
endif()
