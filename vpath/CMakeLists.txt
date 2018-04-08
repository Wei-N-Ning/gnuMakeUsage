cmake_minimum_required(VERSION 3.5)
project(vpath CXX)

set(CMAKE_CXX_STANDARD 11)

add_custom_target(
    mainExe
    ALL COMMAND make -C ${PROJECT_SOURCE_DIR}/sourceTree
        OUT_DIR=${PROJECT_BINARY_DIR}/
)
