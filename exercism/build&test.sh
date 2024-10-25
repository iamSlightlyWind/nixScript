#!/bin/bash

# Get the current directory name
EXERCISE_DIR=$(basename "$PWD")

# Generate build files with cmake
cmake -G "Unix Makefiles" .

# Build the project with make
make

# Run the main binary
if [ -f "./$EXERCISE_DIR" ]; then
    ./"$EXERCISE_DIR"
else
    echo "Binary file ./$EXERCISE_DIR not found. Please check the build output."
    exit 1
fi

# Run the test binary
TEST_BINARY="./test_${EXERCISE_DIR}"
if [ -f "$TEST_BINARY" ]; then
    "$TEST_BINARY"
else
    echo "Test binary $TEST_BINARY not found. Please check the build output."
    exit 1
fi