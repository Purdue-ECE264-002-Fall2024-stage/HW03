# ***
# *** DO NOT modify this file 
# ***

WARNING = -Wall -Wshadow --pedantic
ERROR = -Wvla -Werror
GCC = gcc -std=c99 -g $(WARNING) $(ERROR) 

TESTFALGS = -DTEST_ADDFILE -DTEST_WRITESUM # -DDEBUG

SRCS = main.c fileint.c
OBJS = $(SRCS:%.c=%.o)

# diff -w means do not care about space

hw03: $(OBJS) 
	$(GCC) $(TESTFALGS) $(OBJS) -o hw03

.c.o: 
	$(GCC) $(TESTFALGS) -c $*.c 

testall: test1 test2 test3 test4 test5 test6

test1: hw03
	./hw03 inputs/input1 output1
	diff -w output1 expected/expected1

test2: hw03
	./hw03 inputs/input2 output2
	diff -w output2 expected/expected2

test3: hw03
	./hw03 inputs/input3 output3
	diff -w output3 expected/expected3

test4: hw03
	./hw03 inputs/input4 output4
	diff -w output4 expected/expected4

test5: hw03
	./hw03 inputs/input5 output5
	diff -w output5 expected/expected5

test6: hw03
	./hw03 inputs/input6 output6
	diff -w output6 expected/expected6

clean: # remove all machine generated files
	rm -f hw03 *.o output* *~

