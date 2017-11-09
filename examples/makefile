.DEFAULT_GOAL := test

FILES :=                \
    Hello               \
    UnitTests3          \
    Coverage1           \
    Coverage2           \
    Coverage3

%.app: %.c++
	g++-5 -pedantic -std=c++14 -Wall -Weffc++ $< -o $@ -lgtest -lgtest_main -pthread
	-clang-check -extra-arg=-std=c++11          $< --
	-clang-check -extra-arg=-std=c++11 -analyze $< --

%.c++x: %.app
	./$<

all: $(FILES)

clean:
	rm -f *.bin
	rm -f *.gcda
	rm -f *.gcno
	rm -f *.gcov
	rm -f *.plist
	rm -f $(FILES)

run: $(FILES:=.c++x)

travis:
	make clean
	ls -al
	make
	ls -al
	make run
