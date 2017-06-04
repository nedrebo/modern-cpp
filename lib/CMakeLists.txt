project(mylib LANGUAGES CXX)

file(GLOB_RECURSE HEADERS "*.h")

add_library(${PROJECT_NAME}
    ${HEADERS}
    src/public.cpp
    src/private.cpp)

target_include_directories(${PROJECT_NAME}
    PUBLIC include
    PRIVATE src include/mylib)

target_link_libraries(${PROJECT_NAME}
    boost)
