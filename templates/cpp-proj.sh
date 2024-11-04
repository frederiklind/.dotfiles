#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;032m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'
NONE='\033[0m'

ERR=""
CHK="✓"
NAME=""
TYPE=""

# prompt for project name 
function enter_name() {
    read -p "Enter project name: " n
    if [[ -z "${n// }" ]]; then
        echo -e "${RED}${ERR}${NONE} Invalid name.\n"
        enter_name
    else
        NAME=$n
        echo
    fi
}

# select between make and cmake
function enter_type() {
    echo -e "${BOLD}${BLUE}Select build tool:${NONE}\n"
    echo -e "1. ${MAGENTA} ${NONE}Make"
    echo -e "2. ${GREEN}󰔶 ${NONE}CMake\n"

    read -p "Enter option: " n

    if [[ "$n" != "1" && "$n" != "2" ]]; then
        echo -e "${RED}${ERR}${NONE} Invalid option.\n"
        enter_type
    else
        TYPE=$n
        echo
    fi
}

function setup() {
    mkdir "$(pwd)/${NAME}"
    cd "$(pwd)/${NAME}"
    
    mkdir src build include

    case $1 in
    1)
        echo -e "${BLUE}|-${BOLD}${CYAN}>${NONE} Creating Makefile."
        touch Makefile

        echo -e "${BLUE}|-${BOLD}${CYAN}>${NONE} Generating default Makefile config."
cat <<EOF > Makefile
CXX = g++

CXXFLAGS = -Iinclude -Wall -Wextra -std=c++17

# dirs
SRCDIR = src
BUILDDIR = build

TARGET = \$(BUILDDIR)/${NAME}

SOURCES = \$(wildcard \$(SRCDIR)/*.cpp)
OBJECTS = \$(patsubst \$(SRCDIR)/%.cpp, \$(BUILDDIR)/%.o, \$(SOURCES))

all: \$(TARGET)

\$(TARGET): \$(OBJECTS)
	\$(CXX) \$(OBJECTS) -o \$@

\$(BUILDDIR)/%.o: \$(SRCDIR)/%.cpp
	mkdir -p \$(BUILDDIR)
	\$(CXX) \$(CXXFLAGS) -c \$< -o \$@

clean:
	rm -rf \$(BUILDDIR)/*
EOF
        ;;
    2)

        echo -e "${BLUE}|-${BOLD}${CYAN}>${NONE} Creating CMakeLists.txt."       
        touch CMakeLists.txt

        echo -e "${BLUE}|-${BOLD}${CYAN}>${NONE} Generating default CMake config."
cat <<EOF > CMakeLists.txt
cmake_minimum_required(VERSION 3.10)
project(${NAME})

set(CMAKE_CXX_STANDARD 17)
set(SOURCE_FILES src/main.cpp)

include_directories(include)

add_executable(\${PROJECT_NAME} \${SOURCE_FILES})
EOF
        ;;
    *)
        exit 1
        ;;
    esac

    echo -e "${BLUE}|-${BOLD}${CYAN}>${NONE} Creating source files."
    touch "src/main.cpp"
    cat <<EOF > "src/main.cpp"
#include <iostream>
#include "example_class.h"

int main() {
    std::cout << "Herp Derp!" << std::endl;
    return 0;
}
EOF

    touch "src/example_class.cpp"
    cat <<EOF > "src/example_class.cpp"
#include "example_class.h"
#include <iostream>

void ExampleClass::sayHello() {
    std::cout << "Hello from ExampleClass!" << std::endl;
}
EOF

    touch "include/example_class.h"
    cat <<EOF > "include/example_class.h"
#ifndef EXAMPLE_CLASS_H
#define EXAMPLE_CLASS_H

class ExampleClass {
public:
    void sayHello();
};

#endif // EXAMPLE_CLASS_H
EOF

}

# run stuff

echo -e "\n${BOLD}${BLUE}======== ${MAGENTA} ${BLUE}New C++ Project ${BLUE}========${NONE}\n"
enter_name 
enter_type
setup $TYPE

case $TYPE in
    1)
        #compile make
        echo -e "${BLUE}|-${BOLD}${CYAN}>${NONE} Compiling with Make."
        make &> /dev/null || {
            echo -e "${RED}${ERR}${NONE} Compilation failed."
            exit 1
        }
        echo -e "${BLUE}|-${GREEN}${CHK}${NONE} Compilation successful!"
        ;;
    2)
        echo -e "${BLUE}|-${BOLD}${CYAN}>${NONE} Configuring with CMake..."
        cd "build" || exit 1
        cmake .. || {
            echo -e "${RED}${ERR}${NONE} CMake configuration failed."
            exit 1
        }
        echo -e "${BLUE}|-${BOLD}${CYAN}>${NONE} Compiling with Make..."
        make &> /dev/null || {
            echo -e "${RED}${ERR}${NONE} Compilation failed."
            exit 1
        }
        echo -e "${BLUE}|-${GREEN}${CHK}${NONE} Compilation successful!"
        ;;
esac

echo -e "\n${GREEN}${CHK}${NONE} Project created."

# cleanup variables and functions

unset RED
unset GREEN
unset BLUE
unset CYAN
unset MAGENTA
unset BOLD
unset NONE
unset ERR
unset CHK
unset NAME
unset TYPE

unset -f enter_name
unset -f enter_type
unset -f setup
