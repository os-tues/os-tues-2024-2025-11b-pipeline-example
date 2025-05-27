#!/usr/bin/bash

function run_test() {
    TEST_NUMBER=$1
    TEST1_EXPECTED_OUTPUT=$2
    TEST1_EXPECTED_RETURN=$3
    TEST_ARG=$4

    echo Running test $TEST_NUMBER...

    TEST1_ACTUAL_OUTPUT=$(./main $TEST_ARG)
    TEST1_ACTUAL_RETURN=$?

    if [ $TEST1_EXPECTED_RETURN -ne $TEST1_ACTUAL_RETURN ]; then
        echo "Test $TEST_NUMBER failed, expected return: $TEST1_EXPECTED_RETURN, actual: $TEST1_ACTUAL_RETURN"
        return 1
    fi

    if [ $TEST1_EXPECTED_OUTPUT != $TEST1_ACTUAL_OUTPUT ]; then
        echo "Test $TEST_NUMBER failed, expected output: $TEST1_EXPECTED_OUTPUT, actual: $TEST1_ACTUAL_OUTPUT"
        return 1
    fi

    echo "Test $TEST_NUMBER succeeded"
}

if !(test -f main.c); then
  echo "Source file not found."
fi

gcc main.c -o main

PASSED=0
FAILED=0

run_test "that 4^2 = 16" 16 0 4
if [ $? -eq 0 ]; then
  PASSED=$(expr $PASSED + 1)
else
  FAILED=$(expr $FAILED + 1)
fi

run_test "that 5^2 = 25" 26 0 5
if [ $? -eq 0 ]; then
  PASSED=$(expr $PASSED + 1)
else
  FAILED=$(expr $FAILED + 1)
fi

echo Total tests: $(expr $PASSED + $FAILED)
echo Tests passed: $PASSED
echo Tests failed: $FAILED

test $FAILED -eq 0
exit $?