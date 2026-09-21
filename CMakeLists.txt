cmake_minimum_required(VERSION 3.20)

project(FileStream
    VERSION 0.1.0
    LANGUAGES C
)

set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

file(GLOB SOURCES CONFIGURE_DEPENDS
    "${PROJECT_SOURCE_DIR}/src/*.c"
)

add_executable(filestream
    ${SOURCES}
)

target_include_directories(filestream
    PRIVATE
        ${PROJECT_SOURCE_DIR}/include
)

target_compile_options(filestream
    PRIVATE
        -Wall
        -Wextra
        -Wpedantic
)

set_target_properties(filestream PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
)


# cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Debug
# cmake --build build

