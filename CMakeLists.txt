cmake_minimum_required(VERSION 3.10)
project(Hello-World-Docker)

set(CMAKE_CXX_STANDARD 17)

# Main App
add_executable(main main.cpp)
target_link_libraries(main mysqlclient)

# Test App
add_executable(db_test tests/db_test.cpp)
target_include_directories(db_test PRIVATE extern)
target_link_libraries(db_test mysqlclient pthread)
