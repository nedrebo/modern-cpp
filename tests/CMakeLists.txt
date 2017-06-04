project(tests LANGUAGES CXX)

file(GLOB_RECURSE HEADERS "*.h")

add_executable(${PROJECT_NAME}
    ${HEADERS}
    main.cpp
    lib/src/public.cpp
    lib/src/private.cpp)

target_link_libraries(${PROJECT_NAME}
    mylib)

# Get access to library internals
get_target_property(MYLIB_PRIVATE_INCLUDE_DIRECTORIES mylib INCLUDE_DIRECTORIES)
target_include_directories(${PROJECT_NAME}
    PRIVATE ${MYLIB_PRIVATE_INCLUDE_DIRECTORIES})

if(CMAKE_BUILD_TYPE STREQUAL "Coverage")
    setup_target_for_coverage(${PROJECT_NAME}Coverage ${PROJECT_NAME} coverage)
endif()
