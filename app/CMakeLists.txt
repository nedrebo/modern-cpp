project(myapp LANGUAGES CXX)

file(GLOB_RECURSE HEADERS "*.h")

add_executable(${PROJECT_NAME}
    ${HEADERS}
    main.cpp)

target_link_libraries(${PROJECT_NAME}
    mylib)
