cmake_minimum_required(VERSION 3.10)
project(hello-world-docker)

set(CMAKE_CXX_STANDARD 17)

add_executable(hellodocker main.cpp)
target_link_libraries(hellodocker mysqlclient)
