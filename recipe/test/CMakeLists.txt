cmake_minimum_required(VERSION 3.20)

project(test-yaml-cpp LANGUAGES CXX)

add_executable(test-yaml-cpp test.cpp)

find_package(yaml-cpp REQUIRED)
target_link_libraries(test-yaml-cpp PRIVATE yaml-cpp::yaml-cpp)

get_target_property(YAML_TYPE yaml-cpp::yaml-cpp TYPE)
if(YAML_TYPE STREQUAL "STATIC_LIBRARY")
    target_compile_definitions(test-yaml-cpp PRIVATE YAML_CPP_STATIC_DEFINE)
endif()

enable_testing()
add_test(NAME test-yaml-cpp COMMAND test-yaml-cpp)
