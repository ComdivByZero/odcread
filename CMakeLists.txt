cmake_minimum_required(VERSION 3.13)
project(odcread)

set(CMAKE_CXX_STANDARD 17)

include_directories(${PROJECT_SOURCE_DIR})

add_executable(odcread "")

install(TARGETS odcread DESTINATION bin)

cmake_policy(SET CMP0076 NEW)

target_sources(odcread
        PRIVATE
        oberon.h
        )
add_subdirectory(main)
add_subdirectory(reader)
add_subdirectory(store)
add_subdirectory(alien)
add_subdirectory(typeregister)
add_subdirectory(textmodel)
add_subdirectory(fold)
add_subdirectory(typepath)
